import 'dart:math';

import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:farm_home/models/models.dart';

class RecordList extends StatelessWidget {
  final Future<List<Record>> items;
  final Widget? Function(Record)? title;
  final Widget? Function(Record)? subtitle;
  final Widget? Function(Record)? trailing;
  final Widget? Function(Record)? leading;
  final List<Record> Function(List<Record>)? filter;
  final void Function(Record)? onTap;

  const RecordList(
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
    return ItemList<Record>(
      items: items,
      title: (data) => Text(data.title),
      leading: (item) {
        if (leading != null) {
          return leading!(item);
        } else {
          if (item.isDone) {
            return Icon(Icons.check_box);
          } else {
            return Icon(Icons.check_box_outline_blank);
          }
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
          return Column(
            children: [
              Text(data.itemName()),
              Text(data.timestamp.toString().substring(0, 10)),
            ],
          );
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
              builder: (context) => RecordConstants.recordInfo
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
