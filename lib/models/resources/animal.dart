import 'package:farm_home/models/models.dart';

enum Sex { male, female, unknown }

class Animal extends Resource {
  static const collectionName = "Animal";

  late DateTime? birthDate;
  bool isFixed = false; // In relation to neutering/castrasting/spaying
  DateTime? deathDate;
  String nickname = "";
  late Sex sex;
  String animalSpeciesId = "";

  Future<AnimalSpecies?> get animalSpecies async {
    if (animalSpeciesId != "") {
      return await getItemById<AnimalSpecies>(
          animalSpeciesId, (v) => AnimalSpecies.fromMap(v));
    }
    return null;
  }

  Animal(
      {super.name,
      super.notes,
      this.birthDate,
      this.isFixed = false,
      this.deathDate,
      this.nickname = "",
      this.sex = Sex.unknown,
      this.animalSpeciesId = ""});

  Animal.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    if (data["birthDate"] != "") {
      birthDate = DateTime.fromMillisecondsSinceEpoch(data["birthDate"]);
    }

    if (data["deathDate"] != "") {
      deathDate = DateTime.fromMillisecondsSinceEpoch(data["deathDate"]);
    }
    isFixed = data["isFixed"];
    nickname = data["nickname"];
    sex = Sex.values.firstWhere((e) => e.toString() == data['sex']);
    animalSpeciesId = data["animalSpeciesId"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "isFixed": isFixed,
      "birthDate": birthDate?.millisecondsSinceEpoch ?? "",
      "deathDate": deathDate?.millisecondsSinceEpoch ?? "",
      "nickname": nickname,
      "sex": sex.toString(),
      "animalSpeciesId": animalSpeciesId
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return collectionName;
  }
}
