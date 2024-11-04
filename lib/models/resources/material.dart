import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class Material extends Resource {

  String materialTypeId = "";

  Future<MaterialType?> get material async {
    return await getItemById<MaterialType>(
        materialTypeId, (v) => MaterialType.fromMap(v));
  }

  Material({
    super.name,
    super.notes,
    this.materialTypeId = "",
  }) : super();

  Material.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    materialTypeId = data["materialTypeId"];
  }

  @override
  String itemName() {
    return ResourceConstants.material;
  }
}
