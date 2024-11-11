import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart' hide Material;

import 'package:farm_home/models/models.dart';

class ResourceProvider extends ChangeNotifier {
  final ItemAccess _access;

  ResourceProvider(this._access);

  Future<List<Resource>> get resources async {
    return await _access.getItemsByType(ResourceConstants.title, (data) {
      return initResourceByItemName(data);
    });
  }

  Future<List<Animal>> get animals async {
    return await _access.getItems<Animal>(
        ResourceConstants.animal, (v) => Animal.fromMap(v));
  }

  Future<List<Equipment>> get equipment async {
    return await _access.getItems<Equipment>(
        ResourceConstants.equipment, (v) => Equipment.fromMap(v));
  }

  Future<List<Land>> get land async {
    return await _access.getItems<Land>(
        ResourceConstants.land, (v) => Land.fromMap(v));
  }

  Future<List<Material>> get material async {
    return await _access.getItems<Material>(
        ResourceConstants.material, (v) => Material.fromMap(v));
  }

  Future<List<Planting>> get planting async {
    return await _access.getItems<Planting>(
        ResourceConstants.equipment, (v) => Planting.fromMap(v));
  }

  Future<List<Seed>> get seed async {
    return await _access.getItems<Seed>(
        ResourceConstants.equipment, (v) => Seed.fromMap(v));
  }
}
