import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class RecordCategory extends Reference {
  RecordCategory({super.name, super.description});

  RecordCategory.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return ReferenceConstants.recordCategory;
  }
}
