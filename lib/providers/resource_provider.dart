import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class ResourceProvider extends ChangeNotifier {
  ResourceProvider();

  Future<List<Animal>> get animals async {
    return await getItems<Animal>((v) => Animal.fromMap(v));
  }

  Future<List<Crop>> get crops async {
    return await getItems<Crop>((v) => Crop.fromMap(v));
  }
}
