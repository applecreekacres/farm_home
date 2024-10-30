import 'package:farm_home/constants/reference_constants.dart';

import 'references.dart';

class CropFamily extends Reference {
  CropFamily({super.name, super.description});

  CropFamily.fromMap(super.data) : super.fromMap();

  @override
  String itemName() {
    return ReferenceConstants.cropFamily;
  }
}
