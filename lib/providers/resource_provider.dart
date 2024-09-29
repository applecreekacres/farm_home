import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

class ResourceProvider<T extends Resource> extends ChangeNotifier {
  T? _resource;

  T? get resource => _resource;

  set resource(T? value) {
    _resource = value;
    notifyListeners();
  }
}
