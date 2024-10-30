import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';

import 'item_info.dart';

class RecordConstants {
  static const icon = Icons.task;

  static const String title = "Record";
  static const String titlePlural = "Records";

  static const String activity = "Activity";
  static const String harvest = "Harvest";
  static const String input = "Input";
  static const String maintenance = "Maintenance";
  static const String observation = "Observation";
  static const String pottingUp = "Potting Up";
  static const String purchase = "Purchase";
  static const String sale = "Sale";
  static const String seeding = "Seeding";
  static const String transplant = "Transplant";

  static const records = [
    activity,
    harvest,
    input,
    maintenance,
    observation,
    pottingUp,
    purchase,
    sale,
    seeding,
    transplant,
  ];

  static List<ItemInfo> recordInfo = [
    ItemInfo<ActivityRecord>(
      activity,
      Icons.accessibility_new,
      () => ActivityRecordForm(),
      (item) => ActivityRecordForm(record: item,),
    ),
    ItemInfo<HarvestRecord>(
      harvest,
      Symbols.shopping_basket,
      () => HarvestRecordForm(),
      (item) => HarvestRecordForm(
        record: item,
      ),
    ),
    ItemInfo<InputRecord>(
      input,
      Symbols.input,
      () => InputRecordForm(),
      (item) => InputRecordForm(
        record: item,
      ),
    ),
    ItemInfo<ObservationRecord>(
      observation,
      Icons.remove_red_eye,
      () => ObservationRecordForm(),
      (item) => ObservationRecordForm(
        record: item,
      ),
    ),
    ItemInfo<MaintenanceRecord>(
      maintenance,
      Icons.construction,
      () => MaintenanceRecordForm(),
      (item) => MaintenanceRecordForm(
        record: item,
      ),
    ),
    ItemInfo<PottingUpRecord>(
      pottingUp,
      Icons.yard,
      () => PottingUpRecordForm(),
      (item) => PottingUpRecordForm(
        record: item,
      ),
    ),
    ItemInfo<PurchaseRecord>(
      purchase,
      Icons.money,
      () => PurchaseRecordForm(),
      (item) => PurchaseRecordForm(
        record: item,
      ),
    ),
    ItemInfo<SaleRecord>(
      sale,
      Icons.currency_exchange,
      () => SaleRecordForm(),
      (item) => SaleRecordForm(
        record: item,
      ),
    ),
    ItemInfo<SeedingRecord>(
      seeding,
      Symbols.potted_plant,
      () => SeedingRecordForm(),
      (item) => SeedingRecordForm(
        record: item,
      ),
    ),
    ItemInfo<TransplantRecord>(
      transplant,
      Icons.yard,
      () => TransplantRecordForm(),
      (item) => TransplantRecordForm(
        record: item,
      ),
    ),
  ];
}
