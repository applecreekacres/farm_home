import 'package:flutter/material.dart';

class ExpandedRowBox extends StatelessWidget {
  final List<Widget> children;

  const ExpandedRowBox({super.key, required this.children});

  List<Widget> buildChildren() {
    var list = List<Widget>.generate(children.length, (int index) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: children[index],
        ),
      );
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        // color: Theme.of(context).colorScheme.tertiary,
        child: Row(
          children: buildChildren(),
        ),
      ),
    );
  }
}
