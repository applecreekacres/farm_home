import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProvider {
  final FirebaseFirestore firebaseFirestore;

  HomeProvider({required this.firebaseFirestore});

  Future<void> updateFirestore(
      String collectionPath, String path, Map<String, String> data) {
    return firebaseFirestore.collection(collectionPath).doc(path).update(data);
  }

  Stream<QuerySnapshot> getStreamFireStore(
      String pathCollection, int limit, String? textSearch) {
    if (textSearch?.isNotEmpty == true) {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .where("user", isEqualTo: textSearch) // TODO May need to update
          .snapshots();
    } else {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .snapshots();
    }
  }
}
