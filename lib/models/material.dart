import 'package:farm_home/models/models.dart';

class Material extends Resource {
  String _materialTypeId = "";

  Future<MaterialType?> get material =>
      getItemById<MaterialType>(_materialTypeId);

  Material(MaterialType type) : super((Material).toString()) {
    _materialTypeId = type.id;
  }

  Material.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _materialTypeId = data["materialTypeId"];
  }
}
