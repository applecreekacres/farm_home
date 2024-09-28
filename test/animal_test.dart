import 'package:flutter_test/flutter_test.dart';
import 'package:farm_home/models/models.dart';

void main() {
  test("Create new Animal with no arguments.", () {
    final animal = Animal();

    expect(animal.name, "");
    expect(animal.birthDate, null);
    expect(animal.deathDate, null);
    expect(animal.isFixed, false);
    expect(animal.sex, Sex.unknown);
    expect(animal.nickname, "");
    expect(animal.notes, "");
    expect(animal.species, null);
    expect(animal.itemName(), "Animal");
    expect(animal.itemType(), "Resource");
  });

  test("Create Animal from Map", () {
    Map<String, dynamic> map = {
      "name": "Captain",
      "notes": "Test animal",
      "nickname": "Meowgan",
      "birthDate": DateTime(2013, 3, 15).microsecondsSinceEpoch,
      "deathDate": "",
      "isFixed": false.toString(),
      "sex": "male",
      "speciesId": "333444555666", // fake obviously
    };
  });
}
