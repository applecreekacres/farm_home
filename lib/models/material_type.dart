import 'package:farm_home/models/models.dart';

class MaterialType extends Reference {
  static const collectionName = "Material Type";

  MaterialType({super.name, super.description});

  MaterialType.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return collectionName;
  }
}
