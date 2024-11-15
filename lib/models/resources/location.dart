import 'package:farm_home/models/models.dart';

enum LocationType { point, polygon }

abstract class Location extends Resource {
  LocationType? locationType;

  Location({super.name, super.notes, this.locationType}) : super();

  Location.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    locationType = LocationType.values
        .firstWhere((item) => item.toString() == data["locationType"]);
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll(
      {
        "locationType": locationType.toString(),
      },
    );
    return map;
  }
}
