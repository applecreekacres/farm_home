import 'dart:async';

import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class RecordProvider extends ChangeNotifier {
  RecordProvider();

  Future<List<Record>> get records async {
    return await getItemsByType(RecordConstants.title, (data) {
      switch (data["itemName"]) {
        case RecordConstants.activity:
          return ActivityRecord.fromMap(data);
        case RecordConstants.harvest:
          return HarvestRecord.fromMap(data);
        case RecordConstants.input:
          return InputRecord.fromMap(data);
        case RecordConstants.maintenance:
          return MaintenanceRecord.fromMap(data);
        case RecordConstants.observation:
          return ObservationRecord.fromMap(data);
        case RecordConstants.pottingUp:
          return PottingUpRecord.fromMap(data);
        case RecordConstants.purchase:
          return PurchaseRecord.fromMap(data);
        case RecordConstants.sale:
          return SaleRecord.fromMap(data);
        case RecordConstants.seeding:
          return SeedingRecord.fromMap(data);
        case RecordConstants.transplant:
          return TransplantRecord.fromMap(data);
        default:
          throw Error();
      }
    });
  }

  Future<List<Record>> get activities async {
    return await getItems<ActivityRecord>(
        RecordConstants.activity, (v) => ActivityRecord.fromMap(v));
  }
}
