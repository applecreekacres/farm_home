import 'package:farm_home/models/models.dart';

class RecordCategory extends Reference {
  RecordCategory({super.name, super.description});

  @override
  String itemName() {
    return "Record Category";
  }
}
