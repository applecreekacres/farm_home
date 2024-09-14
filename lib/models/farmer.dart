import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class Farmer extends Item {
  final String id;
  final String photoUrl;
  final String name;
  final String description;

  const Farmer(
      {required this.id,
      required this.photoUrl,
      required this.name,
      required this.description});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.name: name,
      FirestoreConstants.description: description,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory Farmer.fromDocument(DocumentSnapshot doc) {
    String description = "";
    String photoUrl = "";
    String name = "";
    try {
      description = doc.get(FirestoreConstants.description);
    } catch (_) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (_) {}
    try {
      name = doc.get(FirestoreConstants.name);
    } catch (_) {}
    return Farmer(
      id: doc.id,
      photoUrl: photoUrl,
      name: name,
      description: description,
    );
  }
}
