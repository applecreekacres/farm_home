import 'package:farm_home/models/models.dart';

class Material extends Resource {
  static const collectionName = "Material";

  String _materialTypeId = "";

  Future<MaterialType?> get material async {
    return await getItemById<MaterialType>(
        _materialTypeId, (v) => MaterialType.fromMap(v));
  }

  Material({super.name, super.notes, MaterialType? type}) {
    _materialTypeId = type?.id ?? "";
  }

  Material.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    _materialTypeId = data["materialTypeId"];
  }

  @override
  String itemName() {
    return collectionName;
  }
}
