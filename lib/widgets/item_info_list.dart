import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

class ItemInfoList extends StatelessWidget {
  final List<ItemInfo> items;
  final Function(ItemInfo)? onTap;
  const ItemInfoList({super.key, required this.items, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(items[index].icon),
          title: Text(items[index].name),
          onTap: () {
            onTap?.call(items[index]);
          },
        );
      },
    );
  }
}
