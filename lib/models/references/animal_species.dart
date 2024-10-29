import 'package:farm_home/models/models.dart';

class AnimalSpecies extends Reference {
  static const collectionName = "Animal Species";

  AnimalSpecies({super.name, super.description});

  AnimalSpecies.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return collectionName;
  }
}
