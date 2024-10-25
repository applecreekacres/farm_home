import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';

import 'item_info.dart';

class RecordConstants {
  static const icon = Icons.task;

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
    ItemInfo(
      activity,
      Icons.accessibility_new,
      () => ActivityRecordForm(),
    ),
    ItemInfo(
      harvest,
      Symbols.shopping_basket,
      () => HarvestRecordForm(),
    ),
    ItemInfo(
      input,
      Symbols.input,
      () => InputRecordForm(),
    ),
    ItemInfo(
      observation,
      Icons.remove_red_eye,
      () => ObservationRecordForm(),
    ),
    ItemInfo(
      maintenance,
      Icons.construction,
      () => MaintenanceRecordForm(),
    ),
    ItemInfo(
      pottingUp,
      Icons.yard,
      () => PottingUpRecordForm(),
    ),
    ItemInfo(
      purchase,
      Icons.money,
      () => PurchaseRecordForm(),
    ),
    ItemInfo(
      sale,
      Icons.currency_exchange,
      () => SaleRecordForm(),
    ),
    ItemInfo(
      seeding,
      Symbols.potted_plant,
      () => SeedingRecordForm(),
    ),
    ItemInfo(
      transplant,
      Icons.yard,
      () => TransplantRecordForm(),
    ),
  ];
}
