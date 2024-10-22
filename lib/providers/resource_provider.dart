import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class ResourceProvider extends ChangeNotifier {
  ResourceProvider();

  Future<List<Animal>> get animals async {
    var items = await getItems<Animal>();
    return items.map((v) => Animal.fromMap(v)).toList();
  }

  Future<List<Crop>> get crops async {
    var items = await getItems<Crop>();
    return items.map((v) => Crop.fromMap(v)).toList();
  }
}
