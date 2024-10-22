import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class RecordProvider extends ChangeNotifier {
  RecordProvider();

  Future<List<Record>> get activities async {
    return await getItems<ActivityRecord>(RecordConstants.activity, (v) => ActivityRecord.fromMap(v));
  }
}
