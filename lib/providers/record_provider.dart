import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class RecordProvider extends ChangeNotifier {
  final ItemAccess _access;

  RecordProvider(this._access);

  Future<List<Record>> get records async {
    return await _access.getItemsByType(RecordConstants.title, (data) {
      return initRecordByItemName(data);
    });
  }

  Future<List<Record>> get activities async {
    return await _access.getItems<ActivityRecord>(
        RecordConstants.activity, (v) => ActivityRecord.fromMap(v));
  }
}
