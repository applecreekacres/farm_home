import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';

import 'item_info.dart';

class ResourceConstants {
  static const icon = Icons.yard;

  static const animal = "Animal";
  static const equipment = "Equipment";
  static const land = "Land";
  static const material = "Material";
  static const planting = "Planting";
  static const seed = "Seed";

  static const resources = [
    animal,
    equipment,
    land,
    material,
    planting,
    seed,
  ];

  static List<ItemInfo> resourceInfo = [
    ItemInfo(
      animal,
      Icons.pets,
      () => AnimalForm(),
    ),
    ItemInfo(
      equipment,
      Icons.agriculture,
      () => EquipmentForm(),
    ),
    ItemInfo(
      land,
      Icons.map,
      () => LandForm(),
    ),
    ItemInfo(
      material,
      Symbols.household_supplies,
      () => MaterialForm(),
    ),
    ItemInfo(
      planting,
      Symbols.potted_plant,
      () => PlantingForm(),
    ),
    ItemInfo(
      seed,
      Symbols.psychiatry,
      () => SeedForm(),
    ),
  ];
}
