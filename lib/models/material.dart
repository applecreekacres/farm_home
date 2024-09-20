import 'package:farm_home/models/models.dart';

class Material extends Resource {
  String _materialTypeId = "";

  Future<MaterialType?> get material async {
    var data = await getItemById<Material>(_materialTypeId);
    if (data != null) {
      return MaterialType.fromMap(data);
    } else {
      return null;
    }
  }

  Material({super.name, super.notes, MaterialType? type}) {
    _materialTypeId = type?.id ?? "";
  }

  Material.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _materialTypeId = data["materialTypeId"];
  }

  @override
  String itemName() {
    return "Material";
  }
}
