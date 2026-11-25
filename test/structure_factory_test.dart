import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('initResourceByItemName returns a Structure', () {
    final data = {
      'itemName': ResourceConstants.structure,
      'name': 'Barn',
      'notes': '',
      'archived': false,
      'locationType': LocationType.point.toString(),
      'structureType': StructureType.building.toString(),
      'id': 'structure-1',
      'userId': 'user-1',
      'created': 0,
      'modified': 0,
    };

    final resource = initResourceByItemName(data);

    expect(resource, isA<Structure>());
    final structure = resource as Structure;
    expect(structure.name, 'Barn');
    expect(structure.structureType, StructureType.building);
  });
}
