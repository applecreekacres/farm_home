import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

abstract class Resource extends Item {
  String name = "";
  String notes = "";
  bool archived = false;

  String get resourceType => (this).runtimeType.toString();

  Resource({
    this.name = "",
    this.notes = "",
    this.archived = false,
  });

  Resource.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    name = data["name"];
    notes = data["notes"];

    // Check that archived exists since it did not exist when the first resources were created.
    archived = data.containsKey("archived") ? data["archived"] : false;
  }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map.addAll(
      {
        "name": name,
        "notes": notes,
        "archived": archived,
      },
    );
    return map;
  }

  @override
  String itemType() {
    return ResourceConstants.title;
  }
}
