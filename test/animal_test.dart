import 'package:flutter_test/flutter_test.dart';
import 'package:farm_home/models/models.dart';
import 'package:uuid/uuid.dart';

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
}
