import 'dart:math';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:farm_home/models/models.dart';

class ResourceList extends StatelessWidget {
  final Future<List<Resource>> items;
  final Widget? Function(Resource)? title;
  final Widget? Function(Resource)? subtitle;
  final Widget? Function(Resource)? trailing;
  final Widget? Function(Resource)? leading;
  final List<Resource> Function(List<Resource>)? filter;
  final void Function(Resource)? onTap;

  const ResourceList(
      {super.key,
      required this.items,
      this.filter,
      this.title,
      this.subtitle,
      this.leading,
      this.trailing,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ItemList<Resource>(
      items: items,
      title: (data) => Text(data.name),
      leading: (item) {
        if (leading != null) {
          return leading!(item);
        } else {
          return Icon(ResourceConstants.resourceInfo
              .where((info) => info.name == item.itemName())
              .first
              .icon);
        }
      },
      subtitle: (data) {
        if (subtitle != null) {
          return subtitle!(data);
        } else {
          if (data.notes == "") {
            return null;
          } else {
            return Text(
                "${data.notes.substring(0, min(20, data.notes.length))}...");
          }
        }
      },
      trailing: (data) {
        if (trailing != null) {
          return trailing!(data);
        } else {
          return null;
        }
      },
      filter: (data) {
        if (filter == null) {
          return data;
        } else {
          return filter!(data);
        }
      },
      onTap: (data) {
        if (onTap != null) {
          onTap!(data);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResourceConstants.resourceInfo
                  .where((ref) => ref.name == data.itemName())
                  .first
                  .edit(data)!,
            ),
          );
        }
      },
    );
  }
}
