import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

class ItemInfo<T extends Item> {
  IconData icon;
  String name;
  Function() init;
  Function(T item) edit;

  ItemInfo(this.name, this.icon, this.init, this.edit);
}
