import 'package:farm_home/widgets/async_value_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class ItemList<T> extends StatelessWidget {
  final AsyncValue<List<T>> items;
  final Widget? Function(T)? title;
  final Widget? Function(T)? subtitle;
  final Widget? Function(T)? trailing;
  final Widget? Function(T)? leading;
  final List<T> Function(List<T>)? filter;
  final void Function(T)? onTap;

  const ItemList({
    super.key,
    required this.items,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return AsyncValueView<List<T>>(
      value: items,
      onLoading: () => Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      onData: (data) {
        final modifiedList = filter != null ? filter!.call(data) : data;
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
      },
      onError: (error) => const Text("Failed to load items"),
    );
  }
}
