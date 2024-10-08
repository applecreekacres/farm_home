import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class Unit extends Reference {
  Unit({super.name, super.description});

  Unit.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return ReferenceConstants.unit;
  }
}
