import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/animal_species_form.dart';
import 'package:farm_home/pages/pages.dart';

class ReferenceInfo {
  IconData icon;
  String name;
  Function() init;

  ReferenceInfo(this.name, this.icon, this.init);
}

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

  static List<ReferenceInfo> referenceInfo = [
    ReferenceInfo(
      animalSpecies,
      Icons.pets,
      () => AnimalSpeciesForm(),
    ),
    ReferenceInfo(
      unit,
      Icons.scale,
      () => UnitForm(),
    ),
    ReferenceInfo(
      season,
      Icons.sunny_snowing,
      () => SeasonForm(),
    ),
    ReferenceInfo(
      materialType,
      Symbols.household_supplies,
      () => MaterialTypeForm(),
    ),
    ReferenceInfo(
      cropFamily,
      Symbols.park,
      () => CropFamilyForm(),
    ),
    ReferenceInfo(
      crop,
      Symbols.grass,
      () => CropForm(),
    ),
  ];
}
