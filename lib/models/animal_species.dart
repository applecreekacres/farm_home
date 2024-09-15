import 'package:farm_home/models/models.dart';

class AnimalSpecies extends Reference {
  AnimalSpecies(super.name, super.description);

  AnimalSpecies.fromMap(super.data) : super.fromMap();
}
