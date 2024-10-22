import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class RecordProvider extends ChangeNotifier {
  RecordProvider();

  Future<List<Record>> get activities async {
    var items = await getItems<ActivityRecord>();
    return items.map((v) => ActivityRecord.fromMap(v)).toList();
  }
}
