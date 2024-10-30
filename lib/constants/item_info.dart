import 'package:farm_home/models/models.dart';
import 'package:flutter/material.dart';

class ItemInfo<T extends Item> {
  IconData icon;
  String name;
  Widget? Function() init;
  Widget? Function(dynamic item) edit;

  ItemInfo(this.name, this.icon, this.init, this.edit);
}
