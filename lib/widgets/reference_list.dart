import 'dart:math';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:farm_home/models/models.dart';

class ReferenceList extends StatelessWidget {
  final Future<List<Reference>> items;
  final Widget? Function(Reference)? title;
  final Widget? Function(Reference)? subtitle;
  final Widget? Function(Reference)? trailing;
  final Widget? Function(Reference)? leading;
  final List<Reference> Function(List<Reference>)? filter;
  final void Function(Reference)? onTap;

  const ReferenceList(
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
    return ItemList<Reference>(
      items: items,
      title: (data) => Text(data.name),
      leading: (item) {
        if (leading != null) {
          return leading!(item);
        } else {
          return Icon(ReferenceConstants.referenceInfo
              .where((info) => info.name == item.itemName())
              .first
              .icon);
        }
      },
      subtitle: (data) {
        if (subtitle != null) {
          return subtitle!(data);
        } else {
          if (data.description == "") {
            return null;
          } else {
            return Text(
                "${data.description.substring(0, min(20, data.description.length))}...");
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
              builder: (context) => ReferenceConstants.referenceInfo
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
