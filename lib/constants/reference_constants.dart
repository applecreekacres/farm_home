import 'package:flutter/material.dart' hide MaterialType;

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/pages/pages.dart';

import 'item_info.dart';

class ReferenceConstants {
  static const icon = Icons.abc;

  static const String title = "Reference";
  static const String titlePlural = "References";

  static const animalSpecies = "Animal Species";
  static const unit = "Unit";
  static const season = "Season";
  static const materialType = "Material Type";
  static const cropFamily = "Crop Family";
  static const crop = "Crop";
  static const recordCategory = "Record Category";

  static const references = [
    animalSpecies,
    unit,
    season,
    materialType,
    cropFamily,
    crop,
    recordCategory,
  ];

  static List<ItemInfo> referenceInfo = [
    ItemInfo<AnimalSpecies>(
      animalSpecies,
      Icons.pets,
      () => AnimalSpeciesForm(),
      (item) => AnimalSpeciesForm(
        record: item,
      ),
    ),
    ItemInfo<Unit>(
      unit,
      Icons.scale,
      () => UnitForm(),
      (item) => UnitForm(
        record: item,
      ),
    ),
    ItemInfo<Season>(
      season,
      Icons.sunny_snowing,
      () => SeasonForm(),
      (item) => SeasonForm(
        record: item,
      ),
    ),
    ItemInfo<MaterialType>(
      materialType,
      Symbols.household_supplies,
      () => MaterialTypeForm(),
      (item) => MaterialTypeForm(
        record: item,
      ),
    ),
    ItemInfo<CropFamily>(
      cropFamily,
      Symbols.park,
      () => CropFamilyForm(),
      (item) => CropFamilyForm(
        record: item,
      ),
    ),
    ItemInfo<Crop>(
      crop,
      Symbols.grass,
      () => CropForm(),
      (item) => CropForm(
        crop: item,
      ),
    ),
    ItemInfo<RecordCategory>(
      recordCategory,
      Icons.category,
      () => RecordCategoryForm(),
      (item) => RecordCategoryForm(record: item),
    )
  ];
}
