import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';

import 'package:farm_home/pages/pages.dart';

class ResourceSelectWidget extends StatelessWidget {
  ResourceSelectWidget({super.key});

  final resItems = ResourceConstants.resourceInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(resItems[index].icon),
          title: Text(resItems[index].name),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => resItems[index].init()));
          },
        );
      },
    );
  }
}
