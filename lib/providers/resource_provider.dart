import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class ResourceProvider extends ChangeNotifier {
  ResourceProvider();

  Future<List<Animal>> get animals async {
    var items = await getItemsByUser(ResourceConstants.animal);
    return items.map((v) => Animal.fromMap(v)).toList();
  }

  Future<List<Crop>> get crops async {
    var items = await getItemsByUser(ResourceConstants.crop);
    return items.map((v) => Crop.fromMap(v)).toList();
  }
}
