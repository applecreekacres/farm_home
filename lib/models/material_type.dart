import 'package:farm_home/models/models.dart';

class MaterialType extends Reference {
  MaterialType({super.name, super.description});

  @override
  String referenceType() {
    return "Material Type";
  }
}
