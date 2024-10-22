import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class ReferenceProvider extends ChangeNotifier {
  ReferenceProvider();

  Future<List<CropFamily>> get cropFamilies async {
    var items = await getItems<CropFamily>();
    return items.map((v) => CropFamily.fromMap(v)).toList();
  }

  Future<List<AnimalSpecies>> get animalSpecies async {
    var items = await getItems<AnimalSpecies>();
    return items.map((v) => AnimalSpecies.fromMap(v)).toList();
  }
}
