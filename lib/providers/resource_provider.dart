import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart' hide Material;

import 'package:farm_home/models/models.dart';

class ResourceProvider extends ChangeNotifier {
  ResourceProvider();

  Future<List<Resource>> get resources async {
    return await getItemsByType(ResourceConstants.title, (data) {
      return initResourceByItemName(data);
    });
  }

  Future<List<Animal>> get animals async {
    return await getItems<Animal>(
        ResourceConstants.animal, (v) => Animal.fromMap(v));
  }

  Future<List<Equipment>> get equipment async {
    return await getItems<Equipment>(
        ResourceConstants.equipment, (v) => Equipment.fromMap(v));
  }

  Future<List<Land>> get land async {
    return await getItems<Land>(ResourceConstants.land, (v) => Land.fromMap(v));
  }

  Future<List<Material>> get material async {
    return await getItems<Material>(
        ResourceConstants.material, (v) => Material.fromMap(v));
  }

  Future<List<Planting>> get planting async {
    return await getItems<Planting>(
        ResourceConstants.equipment, (v) => Planting.fromMap(v));
  }

  Future<List<Seed>> get seed async {
    return await getItems<Seed>(
        ResourceConstants.equipment, (v) => Seed.fromMap(v));
  }
}
