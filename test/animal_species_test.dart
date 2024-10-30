import 'package:farm_home/constants/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farm_home/models/models.dart';
import 'package:uuid/uuid.dart';

void main() {
  test("Create new Animal Species", () {
    final species = AnimalSpecies(name: "Dog", description: "Test species");

    expect(species.name, "Dog");
    expect(species.description, "Test species");
    expect(species.itemName(), "Animal Species");
  });

  test("Create AnimalSpecies from Map", () {
    final id = const Uuid().v4();
    final userId = const Uuid().v4();
    Map<String, dynamic> map = {
      "name": "Cat",
      "description": "Test",
      "id": id,
      "userId": userId,
      "created":
          DateTime(DateTime.now().year, 1, 2, 3, 4, 5).millisecondsSinceEpoch,
      "modified":
          DateTime(DateTime.now().year, 5, 4, 3, 2, 1).millisecondsSinceEpoch,
      "itemName": "Animal Species"
    };

    final species = AnimalSpecies.fromMap(map);

    expect(species.name, "Cat");
    expect(species.description, "Test");
    expect(species.id, id);
  });

  test("Get map from AnimalSpecies", () {
    final id = const Uuid().v4();
    final userId = const Uuid().v4();
    Map<String, dynamic> map = {
      "name": "Cat",
      "description": "Test",
      "id": id,
      "userId": userId,
      "created":
          DateTime(DateTime.now().year, 1, 2, 3, 4, 5).millisecondsSinceEpoch,
      "modified":
          DateTime(DateTime.now().year, 5, 4, 3, 2, 1).millisecondsSinceEpoch,
      "itemName": "Animal Species",
      "itemType": ReferenceConstants.title
    };

    final species = AnimalSpecies.fromMap(map);

    expect(species.toMap(), map);
  });
}
