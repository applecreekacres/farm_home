import 'resource.dart';

enum Sex { male, female }

class Animal extends Resource {
  late DateTime birthDate;
  bool isFixed = false; // In relation to neutering/castrasting/spaying
  late DateTime deathDate;
  String nickname = "";
  late Sex sex;

  Animal(super.id, super.created, super.modified, super.tags, this.birthDate,
      this.isFixed, this.deathDate, this.nickname, this.sex);

  ///
  Animal.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    birthDate = data["birthDate"];
    isFixed = data["isFixed"];
    nickname = data["nickname"];
    sex = data["sex"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "isFixed": isFixed,
      "birthDate": birthDate,
      "deathDate": deathDate,
      "nickname": nickname,
      "sex": sex
    };
    map.addAll(super.toMap());
    return map;
  }
}
