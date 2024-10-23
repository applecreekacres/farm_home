import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ItemList<T> extends StatefulWidget {
  final Future<List<T>> items;
  final Widget? Function(T)? title;
  final Widget? Function(T)? trailing;
  final Widget? Function(T)? leading;

  const ItemList(
      {super.key,
      required this.items,
      this.leading,
      this.title,
      this.trailing});

  @override
  State<ItemList<T>> createState() => _ItemListState<T>();
}

class _ItemListState<T> extends State<ItemList<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      future: widget.items,
      onData: (data) {
        if (data != null) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: widget.leading?.call(data[index]),
                title: widget.title?.call(data[index]),
                trailing: widget.trailing?.call(data[index]),
              );
            },
          );
        } else {
          return const Text("Failed to load items");
        }
      },
    );
  }
}
