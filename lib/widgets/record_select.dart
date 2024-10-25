import 'package:farm_home/constants/constants.dart';
import 'package:flutter/material.dart';

class RecordSelectWidget extends StatelessWidget {
  RecordSelectWidget({super.key});

  final recItems = RecordConstants.recordInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(recItems[index].icon),
          title: Text(recItems[index].name),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => recItems[index].init()));
          },
        );
      },
    );
  }
}
