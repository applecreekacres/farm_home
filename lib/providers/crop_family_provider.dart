import 'dart:async';

import 'package:flutter/material.dart';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/models/models.dart';

class CropFamilyProvider extends ChangeNotifier {
  CropFamilyProvider();

  @override
  void dispose() {
    if (!_controller.isClosed) {
      _controller.close();
    }
    super.dispose();
  }

  late final StreamController<List<CropFamily>> _controller =
      StreamController(onListen: () async {
    var items = await getItemsByUser(ReferenceConstants.cropFamily);
    _controller.add(items.map((value) {
      return CropFamily.fromMap(value);
    }).toList());
    _controller.close();
  });

  Stream<List<CropFamily>> get cropFamilies => _controller.stream;

}
