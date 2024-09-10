import 'resource.dart';

enum Sex { male, female }

class Animal extends Resource {
  late DateTime _birthDate;
  bool _isFixed = false; // In relation to neutering/castrasting/spaying
  late DateTime _deathDate;
  String _nickname = "";
  late Sex _sex;

  DateTime get birthDate => _birthDate;

  DateTime get deathDate => _deathDate;

  bool get isFixed => _isFixed;

  String get nickname => _nickname;

  Sex get sex => _sex;

  set birthDate(DateTime date) {
    if (date != _birthDate) {
      _birthDate = date;
      update();
    }
  }

  set deathDate(DateTime date) {
    if (date != _deathDate) {
      _deathDate = date;
      update();
    }
  }

  set isFixed(bool fixed) {
    if (fixed != _isFixed) {
      _isFixed = fixed;
      update();
    }
  }

  set nickname(String name) {
    if (name != _nickname) {
      _nickname = name;
      update();
    }
  }

  set sex(Sex s) {
    if (s != _sex) {
      _sex = s;
      update();
    }
  }

  Animal(List<String> tags, this._birthDate, this._isFixed, this._deathDate,
      this._nickname, this._sex)
      : super(tags, (Animal).toString());

  Animal.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _birthDate = DateTime.fromMillisecondsSinceEpoch(data["birthDate"]);
    _deathDate = DateTime.fromMillisecondsSinceEpoch(data["deathDate"]);
    _isFixed = data["isFixed"];
    _nickname = data["nickname"];
    _sex = data["sex"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "isFixed": _isFixed,
      "birthDate": _birthDate.millisecondsSinceEpoch,
      "deathDate": _deathDate.millisecondsSinceEpoch,
      "nickname": _nickname,
      "sex": _sex
    };
    map.addAll(super.toMap());
    return map;
  }
}
