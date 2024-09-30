import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class MaterialType extends Reference {
  MaterialType({super.name, super.description});

  MaterialType.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return ReferenceConstants.materialType;
  }
}
