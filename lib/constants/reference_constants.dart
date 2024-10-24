import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/animal_species_form.dart';
import 'package:farm_home/pages/pages.dart';

class ReferenceInfo {
  Icon icon;
  String name;

  ReferenceInfo(this.name, this.icon);
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

  static List<Map<String, dynamic>> referenceInfo = [
    {
      "name": animalSpecies,
      "icon": Icons.pets,
      "form": () => AnimalSpeciesForm(),
    },
    {
      "name": unit,
      "icon": Icons.scale,
      "form": () => UnitForm(),
    },
    {
      "name": season,
      "icon": Icons.sunny_snowing,
      "form": () => SeasonForm(),
    },
    {
      "name": materialType,
      "icon": Symbols.household_supplies,
      "form": () => MaterialTypeForm(),
    },
    {
      "name": cropFamily,
      "icon": Symbols.park,
      "form": () => CropFamilyForm(),
    },
    {
      "name": crop,
      "icon": Symbols.grass,
      "form": () => CropForm(),
    },
  ];
}
