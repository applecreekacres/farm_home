import 'package:farm_home/constants/reference_constants.dart';

import 'models.dart';

class CropFamily extends Reference {

  CropFamily({super.name, super.description});

  @override
  String itemName() {
    return ReferenceConstants.cropFamily;
  }
}
