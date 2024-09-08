import 'resource.dart';

enum Sex { male, female }

class Animal extends Resource {
  late DateTime birthDate;
  bool isFixed = false; // In relation to neutering/castrasting/spaying
  late DateTime deathDate;
  String nickname = "";
  late Sex sex;

  Animal(List<String> tags, this.birthDate, this.isFixed, this.deathDate,
      this.nickname, this.sex) : super(tags, (Animal).toString());

  ///
  Animal.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    birthDate = DateTime.fromMillisecondsSinceEpoch(data["birthDate"]);
    deathDate = DateTime.fromMillisecondsSinceEpoch(data["deathDate"]);
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
