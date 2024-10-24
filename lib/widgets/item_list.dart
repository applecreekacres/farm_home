import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ItemList<T> extends StatefulWidget {
  final Future<List<T>> items;
  final Widget? Function(T)? title;
  final Widget? Function(T)? trailing;
  final Widget? Function(T)? leading;
  final List<T> Function(List<T>)? filter;
  final void Function()? onTap;

  const ItemList(
      {super.key,
      required this.items,
      this.leading,
      this.title,
      this.trailing,
      this.onTap,
      this.filter});

  @override
  State<ItemList<T>> createState() => _ItemListState<T>();
}

class _ItemListState<T> extends State<ItemList<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      future: widget.items,
      onData: (data) {
        List<T> modifiedList;
        if (data != null) {
          if (widget.filter != null) {
            modifiedList = widget.filter!.call(data);
          } else {
            modifiedList = data;
          }
          return ListView.builder(
            itemCount: modifiedList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: widget.leading?.call(modifiedList[index]),
                title: widget.title?.call(modifiedList[index]),
                trailing: widget.trailing?.call(modifiedList[index]),
                onTap: widget.onTap,
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
