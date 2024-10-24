import 'package:flutter/material.dart';

class ItemInfo {
  IconData icon;
  String name;
  Function() init;

  ItemInfo(this.name, this.icon, this.init);
}
