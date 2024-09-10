import 'models.dart';

enum SeedingMethod { direct, greenhouseSown, transplantFromPurchased }

class SeedingRecord extends Record {
  DateTime _seedingDate = DateTime.now();
  SeedingMethod _seedingMethod = SeedingMethod.direct;

  DateTime get seedingDate => _seedingDate;

  SeedingMethod get seedingMethod => _seedingMethod;

  set seedingDate(DateTime date) {
    if (date != _seedingDate) {
      _seedingDate = date;
      update();
    }
  }

  set seedingMethod(SeedingMethod method) {
    if (method != _seedingMethod) {
      _seedingMethod = method;
      update();
    }
  }

  SeedingRecord(
      List<String> tags,
      String title,
      DateTime timestamp,
      String description,
      bool isDone,
      List<Quantity> quantities,
      List<Resource> resources,
      this._seedingDate,
      this._seedingMethod)
      : super(tags, title, timestamp, description, isDone, quantities,
            resources, (SeedingRecord).toString());

  SeedingRecord.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _seedingDate = DateTime.fromMillisecondsSinceEpoch(data["seedingDate"]);
    _seedingMethod = data["seedingMethod"];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "seedingDate": _seedingDate.millisecondsSinceEpoch,
      "seedingMethod": _seedingMethod
    };
    map.addAll(super.toMap());
    return map;
  }
}
