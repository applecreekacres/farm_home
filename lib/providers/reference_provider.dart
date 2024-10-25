import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart' hide MaterialType;

import 'package:farm_home/models/models.dart';

class ReferenceProvider extends ChangeNotifier {
  ReferenceProvider();

  Future<List<CropFamily>> get cropFamilies async {
    return await getItems<CropFamily>(
        ReferenceConstants.cropFamily, (v) => CropFamily.fromMap(v));
  }

  Future<List<Crop>> get crops async {
    return await getItems<Crop>(
        ReferenceConstants.crop, (v) => Crop.fromMap(v));
  }

  Future<List<AnimalSpecies>> get animalSpecies async {
    return await getItems<AnimalSpecies>(
        ReferenceConstants.animalSpecies, (v) => AnimalSpecies.fromMap(v));
  }

  Future<List<Unit>> get units async {
    return await getItems<Unit>(
        ReferenceConstants.unit, (v) => Unit.fromMap(v));
  }

  Future<List<Season>> get seasons async {
    return await getItems<Season>(
        ReferenceConstants.season, (v) => Season.fromMap(v));
  }

  Future<List<MaterialType>> get materialType async {
    return await getItems<MaterialType>(
        ReferenceConstants.materialType, (v) => MaterialType.fromMap(v));
  }

  Future<List<Reference>> get references async {
    return await getItemsByType(ReferenceConstants.title, (data) {
      switch (data["itemName"]) {
        case ReferenceConstants.animalSpecies:
          return AnimalSpecies.fromMap(data);
        case ReferenceConstants.crop:
          return Crop.fromMap(data);
        case ReferenceConstants.cropFamily:
          return CropFamily.fromMap(data);
        case ReferenceConstants.materialType:
          return MaterialType.fromMap(data);
        case ReferenceConstants.season:
          return Season.fromMap(data);
        case ReferenceConstants.unit:
          return Unit.fromMap(data);
        default:
          throw Error();
      }
    });
  }
}
