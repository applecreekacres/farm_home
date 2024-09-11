import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateException,
  authenticateCanceled,
}

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final SharedPreferences prefs;

  AuthProvider({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.prefs,
    required this.firebaseFirestore,
  });

  Status _status = Status.uninitialized;

  Status get status => _status;

  String? get userFirebaseId => prefs.getString(FirestoreConstants.id);

  Future<bool> isLoggedIn() async {
    bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn &&
        prefs.getString(FirestoreConstants.id)?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> handleSignIn() async {
    _status = Status.authenticating;
    notifyListeners();

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      _status = Status.authenticateCanceled;
      notifyListeners();
      return false;
    }

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;
    if (firebaseUser == null) {
      _status = Status.authenticateError;
      notifyListeners();
      return false;
    }

    final result = await firebaseFirestore
        .collection(FirestoreConstants.pathUserCollection)
        .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
        .get();
    final documents = result.docs;
    if (documents.isEmpty) {
      // Writing data to server because here is a new user
      firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(firebaseUser.uid)
          .set({
        FirestoreConstants.name: firebaseUser.displayName,
        FirestoreConstants.photoUrl: firebaseUser.photoURL,
        FirestoreConstants.id: firebaseUser.uid,
        FirestoreConstants.createdAt:
            DateTime.now().millisecondsSinceEpoch.toString()
      });

      // Write data to local storage
      User? currentUser = firebaseUser;
      await prefs.setString(FirestoreConstants.id, currentUser.uid);
      await prefs.setString(
          FirestoreConstants.name, currentUser.displayName ?? "");
      await prefs.setString(
          FirestoreConstants.photoUrl, currentUser.photoURL ?? "");
    } else {
      // Already sign up, just get data from firestore
      final documentSnapshot = documents.first;
      final farmer = Farmer.fromDocument(documentSnapshot);
      await prefs.setString(FirestoreConstants.id, farmer.id);
      await prefs.setString(FirestoreConstants.name, farmer.name);
      await prefs.setString(FirestoreConstants.photoUrl, farmer.photoUrl);
      await prefs.setString(FirestoreConstants.description, farmer.description);
    }
    _status = Status.authenticated;
    notifyListeners();
    return true;
  }

  void handleException() {
    _status = Status.authenticateException;
    notifyListeners();
  }

  Future<void> handleSignOut() async {
    _status = Status.uninitialized;
    await firebaseAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}