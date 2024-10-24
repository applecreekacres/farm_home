import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';

import 'item_info.dart';

class ReferenceConstants {
  static const animalSpecies = "Animal Species";
  static const unit = "Unit";
  static const season = "Season";
  static const materialType = "Material Type";
  static const cropFamily = "Crop Family";
  static const crop = "Crop";

  static const references = [
    animalSpecies,
    unit,
    season,
    materialType,
    cropFamily,
    crop
  ];

  static List<ItemInfo> referenceInfo = [
    ItemInfo(
      animalSpecies,
      Icons.pets,
      () => AnimalSpeciesForm(),
    ),
    ItemInfo(
      unit,
      Icons.scale,
      () => UnitForm(),
    ),
    ItemInfo(
      season,
      Icons.sunny_snowing,
      () => SeasonForm(),
    ),
    ItemInfo(
      materialType,
      Symbols.household_supplies,
      () => MaterialTypeForm(),
    ),
    ItemInfo(
      cropFamily,
      Symbols.park,
      () => CropFamilyForm(),
    ),
    ItemInfo(
      crop,
      Symbols.grass,
      () => CropForm(),
    ),
  ];
}
