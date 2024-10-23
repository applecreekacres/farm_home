import 'package:farm_home/pages/animal_species_form.dart';
import 'package:flutter/material.dart';

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

  static const List<Map<String, dynamic>> referenceInfo = [
    {
      "name": animalSpecies,
      "icon": Icons.pets,
      "form": AnimalSpeciesForm,
    },
  ];
}
