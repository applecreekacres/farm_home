import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class RecordProvider extends ChangeNotifier {
  RecordProvider();

  List<Record>? record;

  Future<List<Record>> getRecordsInDateRange(
      DateTime start, DateTime end) async {
    var startStamp = start.millisecondsSinceEpoch;
    var endStamp = end.millisecondsSinceEpoch;
    return await getItemsWithQuery(
        (collection) => collection
            .where("timestamp", isGreaterThanOrEqualTo: startStamp)
            .where("timestamp", isLessThanOrEqualTo: endStamp),
        (data) => initRecordByItemName(data));
  }

  Future<void> getRecords() async {
    record = await getItemsByType(RecordConstants.title, (data) {
      return initRecordByItemName(data);
    });
    notifyListeners();
  }

  Future<List<Record>> get records async {
    return await getItemsByType(RecordConstants.title, (data) {
      return initRecordByItemName(data);
    });
  }

  Future<List<Record>> get activities async {
    return await getItems<ActivityRecord>(
        RecordConstants.activity, (v) => ActivityRecord.fromMap(v));
  }
}
