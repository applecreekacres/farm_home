import 'package:farm_home/models/models.dart';

class Material extends Resource {
  String _materialTypeId = "";

  Future<MaterialType?> get material =>
      getItemById<MaterialType>(_materialTypeId);

  Material({super.name, super.notes, MaterialType? type}) {
    _materialTypeId = type?.id ?? "";
  }

  Material.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _materialTypeId = data["materialTypeId"];
  }
}
