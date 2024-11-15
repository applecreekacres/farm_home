import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart' hide Material;

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';

import 'item_info.dart';

class ResourceConstants {
  static const icon = Icons.yard;

  static const String title = "Resource";
  static const String titlePlural = "Resources";

  static const animal = "Animal";
  static const equipment = "Equipment";
  static const land = "Land";
  static const material = "Material";
  static const planting = "Planting";
  static const seed = "Seed";
  static const structure = "Structure";

  static const resources = [
    animal,
    equipment,
    land,
    material,
    planting,
    seed,
    structure,
  ];

  static List<ItemInfo> resourceInfo = [
    ItemInfo<Animal>(
      animal,
      Icons.pets,
      () => AnimalForm(),
      (item) => AnimalForm(
        resource: item,
      ),
    ),
    ItemInfo<Equipment>(
      equipment,
      Icons.agriculture,
      () => EquipmentForm(),
      (item) => EquipmentForm(
        resource: item,
      ),
    ),
    ItemInfo<Land>(
      land,
      Icons.map,
      () => LandForm(),
      (item) => LandForm(
        resource: item,
      ),
    ),
    ItemInfo<Material>(
      material,
      Symbols.household_supplies,
      () => MaterialForm(),
      (item) => MaterialForm(
        resource: item,
      ),
    ),
    ItemInfo<Planting>(
      planting,
      Symbols.potted_plant,
      () => PlantingForm(),
      (item) => PlantingForm(
        resource: item,
      ),
    ),
    ItemInfo<Seed>(
      seed,
      Symbols.psychiatry,
      () => SeedForm(),
      (item) => SeedForm(
        resource: item,
      ),
    ),
    ItemInfo<Structure> (
      structure,
      Icons.home,
      () => StructureForm(),
      (item) => StructureForm(resource: item),

    )
  ];
}
