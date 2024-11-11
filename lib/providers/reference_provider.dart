import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart' hide MaterialType;

import 'package:farm_home/models/models.dart';

class ReferenceProvider extends ChangeNotifier {
  final ItemAccess access;

  ReferenceProvider(this.access);

  Future<List<CropFamily>> get cropFamilies async {
    return await access.getItems<CropFamily>(
        ReferenceConstants.cropFamily, (v) => CropFamily.fromMap(v));
  }

  Future<List<Crop>> get crops async {
    return await access.getItems<Crop>(
        ReferenceConstants.crop, (v) => Crop.fromMap(v));
  }

  Future<List<AnimalSpecies>> get animalSpecies async {
    return await access.getItems<AnimalSpecies>(
        ReferenceConstants.animalSpecies, (v) => AnimalSpecies.fromMap(v));
  }

  Future<List<Unit>> get units async {
    return await access.getItems<Unit>(
        ReferenceConstants.unit, (v) => Unit.fromMap(v));
  }

  Future<List<Season>> get seasons async {
    return await access.getItems<Season>(
        ReferenceConstants.season, (v) => Season.fromMap(v));
  }

  Future<List<MaterialType>> get materialType async {
    return await access.getItems<MaterialType>(
        ReferenceConstants.materialType, (v) => MaterialType.fromMap(v));
  }

  Future<List<RecordCategory>> get recordCategories async {
    return await access.getItems<RecordCategory>(
        ReferenceConstants.recordCategory, (v) => RecordCategory.fromMap(v));
  }

  Future<List<Reference>> get references async {
    return await access.getItemsByType(ReferenceConstants.title, (data) {
      return initReferenceByItemName(data);
    });
  }
}
