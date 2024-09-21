import 'models.dart';

class CropFamily extends Reference {
  static const collectionName = "Crop Family";

  CropFamily({super.name, super.description});

  @override
  String itemName() {
    return collectionName;
  }
}
