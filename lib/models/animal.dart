import 'package:farm_home/models/models.dart';

enum Sex { male, female, unknown }

class Animal extends Resource {
  static const collectionName = "Animal";

  late DateTime? birthDate;
  bool isFixed = false; // In relation to neutering/castrasting/spaying
  DateTime? deathDate;
  String nickname = "";
  late Sex sex;
  String _animalSpeciesId = "";
  AnimalSpecies? species;

  Future<AnimalSpecies?> get animalSpecies async {
    if (_animalSpeciesId != "" && species == null) {
      species = await getItemById<AnimalSpecies>(_animalSpeciesId, (v) => AnimalSpecies.fromMap(v));
    }
    return species;
  }

  void setanimalSpecies(AnimalSpecies? a) {
    species = a;
    _animalSpeciesId = species?.id ?? "";
  }

  Animal(
      {super.name,
      super.notes,
      this.birthDate,
      this.isFixed = false,
      this.deathDate,
      this.nickname = "",
      this.sex = Sex.unknown,
      this.species}) {
    _animalSpeciesId = species?.id ?? "";
  }

  Animal.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (data["birthDate"] != "")
    {
      birthDate = DateTime.fromMillisecondsSinceEpoch(data["birthDate"]);
    }

    if(data["deathDate"] != "")
    {
      deathDate = DateTime.fromMillisecondsSinceEpoch(data["deathDate"]);
    }
    isFixed = data["isFixed"];
    nickname = data["nickname"];
    sex = Sex.values.firstWhere((e) => e.toString() == data['sex']);
    _animalSpeciesId = data["animalSpeciesId"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "isFixed": isFixed,
      "birthDate": birthDate?.millisecondsSinceEpoch ?? "",
      "deathDate": deathDate?.millisecondsSinceEpoch ?? "",
      "nickname": nickname,
      "sex": sex.toString(),
      "animalSpeciesId": _animalSpeciesId
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return collectionName;
  }
}
