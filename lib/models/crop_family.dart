import 'models.dart';

class CropFamily extends Reference {
  CropFamily({super.name, super.description});

  @override
  String itemName() {
    return "Crop Family";
  }
}
