
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;

  SettingProvider({
    required this.prefs,
    required this.firebaseFirestore,
  });

  String? getPref(String key) {
    return prefs.getString(key);
  }

  Future<bool> setPref(String key, String value) async {
    return await prefs.setString(key, value);
  }

  Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }
}
