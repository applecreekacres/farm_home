import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_home/data_access.dart';
import 'package:farm_home/firebase_access.dart';
import 'package:farm_home/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw StateError('sharedPreferencesProvider must be overridden at startup');
});

final dataAccessProvider = Provider<DataAccess>((ref) {
  return FirebaseAccess(FirebaseFirestore.instance);
});

final itemAccessProvider = Provider<ItemAccess>((ref) {
  return ItemAccess(
    ref.watch(dataAccessProvider),
    ref.watch(sharedPreferencesProvider),
  );
});
