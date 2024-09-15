import 'package:farm_home/models/models.dart';

enum Sex { male, female }

class Animal extends Resource {
  late DateTime birthDate;
  bool isFixed = false; // In relation to neutering/castrasting/spaying
  late DateTime deathDate;
  String nickname = "";
  late Sex sex;
  String _animalSpeciesId = "";
  AnimalSpecies? _animalSpecies;

  AnimalSpecies? get animalSpecies {
    if (_animalSpeciesId != "") {
      _animalSpecies =
          getItemById<AnimalSpecies>(_animalSpeciesId) as AnimalSpecies;
    }
    return _animalSpecies;
  }

  set animalSpecies(AnimalSpecies? a) {
    _animalSpecies = a;
    _animalSpeciesId = _animalSpecies?.id ?? "";
  }

  Animal(this.birthDate, this.isFixed, this.deathDate, this.nickname, this.sex,
      this._animalSpecies)
      : super() {
    _animalSpeciesId = _animalSpecies?.id ?? "";
  }

  Animal.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    birthDate = DateTime.fromMillisecondsSinceEpoch(data["birthDate"]);
    deathDate = DateTime.fromMillisecondsSinceEpoch(data["deathDate"]);
    isFixed = data["isFixed"];
    nickname = data["nickname"];
    sex = data["sex"];
    _animalSpeciesId = data["animalSpeciesId"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "isFixed": isFixed,
      "birthDate": birthDate.millisecondsSinceEpoch,
      "deathDate": deathDate.millisecondsSinceEpoch,
      "nickname": nickname,
      "sex": sex,
      "animalSpeciesId": _animalSpeciesId
    };
    map.addAll(super.toMap());
    return map;
  }
}
