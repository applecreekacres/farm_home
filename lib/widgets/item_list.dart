import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ItemList<T> extends StatelessWidget {
  final Future<List<T>> items;
  final Widget? Function(T)? title;
  final Widget? Function(T)? subtitle;
  final Widget? Function(T)? trailing;
  final Widget? Function(T)? leading;
  final List<T> Function(List<T>)? filter;
  final void Function(T)? onTap;

  const ItemList(
      {super.key,
      required this.items,
      this.leading,
      this.title,
      this.subtitle,
      this.trailing,
      this.onTap,
      this.filter});

  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      future: items,
      onLoading: () => Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      onData: (data) {
        List<T> modifiedList;
        if (data != null) {
          if (filter != null) {
            modifiedList = filter!.call(data);
          } else {
            modifiedList = data;
          }
          return ListView.builder(
            itemCount: modifiedList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: leading?.call(modifiedList[index]),
                  title: title?.call(modifiedList[index]),
                  subtitle: subtitle?.call(modifiedList[index]),
                  trailing: trailing?.call(modifiedList[index]),
                  onTap: () => onTap?.call(modifiedList[index]),
                ),
              );
            },
          );
        } else {
          return const Text("Failed to load items");
        }
      },
      onError: (data) => const Text("Failed to load items"),
    );
  }
}
