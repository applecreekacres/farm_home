import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class CropFamilyProvider extends ChangeNotifier {
  CropFamilyProvider();

  Future<List<CropFamily>> get cropFamilies async {
    var items = await getItemsByUser(ReferenceConstants.cropFamily);
    return items.map((v) => CropFamily.fromMap(v)).toList();
  }
}
