import 'package:flutter/material.dart';

import 'package:farm_home/constants/constants.dart';

class ReferenceSelectWidget extends StatelessWidget {
  ReferenceSelectWidget({super.key});

  final refItems = ReferenceConstants.referenceInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: refItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(refItems[index].icon),
          title: Text(refItems[index].name),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => refItems[index].init()));
          },
        );
      },
    );
  }
}
