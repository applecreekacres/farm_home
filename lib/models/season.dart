import 'package:farm_home/constants/constants.dart';

import 'models.dart';

class Season extends Reference {
  /// Default to the first day of the current year
  DateTime start = DateTime(DateTime.now().year, 1, 1);

  /// Default to the last day of the current year
  DateTime end = DateTime(DateTime.now().year, 12, 31, 23, 59, 59, 999, 999);

  Season({super.name, super.description}) {
    start = DateTime(DateTime.now().year, 1, 1);
    end = DateTime(DateTime.now().year, 12, 31, 23, 59, 59, 999, 999);
  }

  Season.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    start = DateTime.fromMillisecondsSinceEpoch(data["start"]);
    end = DateTime.fromMillisecondsSinceEpoch(data["end"]);
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "start": start.millisecondsSinceEpoch,
      "end": end.millisecondsSinceEpoch
    };
    map.addAll(super.toMap());
    return map;
  }

  @override
  String itemName() {
    return ReferenceConstants.season;
  }
}
