import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class ReferenceProvider extends ChangeNotifier {
  ReferenceProvider();

  Future<List<CropFamily>> get cropFamilies async {
    return await getItems<CropFamily>((v) => CropFamily.fromMap(v));
  }

  Future<List<AnimalSpecies>> get animalSpecies async {
    return await getItems<AnimalSpecies>((v) => AnimalSpecies.fromMap(v));
  }
}
