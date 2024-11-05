import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ResourceForm<T extends Resource> extends StatefulWidget {
  final T resource;
  final List<Widget>? additionalFields;
  final bool isNew;

  const ResourceForm(
      {required this.resource,
      required this.isNew,
      this.additionalFields,
      super.key});

  @override
  State<ResourceForm> createState() => _ResourceFormState<T>();
}

class _ResourceFormState<T extends Resource> extends State<ResourceForm<T>> {
  T get resource => widget.resource;
  String get resourceName => widget.resource.resourceType;
  List<Widget> get fields => widget.additionalFields ?? List<Widget>.empty();

  List<Widget> _buildFields() {
    var fields = [
      TextFormField(
          initialValue: widget.isNew ? "" : resource.name,
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter a name' : null,
          onChanged: (value) => resource.name = value),
      NotesField(
        modelField: resource.notes,
      ),
      LabelledCheckbox(
        label: "Archive",
        value: resource.archived,
        onChanged: (value) {
          setState(() {
            resource.archived = value!;
          });
        },
      ),
    ];
    fields.addAll(this.fields);
    return fields;
  }

  Widget buildRecords(BuildContext context) {
    var recProvider = Provider.of<RecordProvider>(context);
    return ItemList(
      items: recProvider.records,
      filter: (items) {
        var filtered = items
            .where((item) => item.resourceIds.contains(resource.id))
            .toList();
        return filtered;
      },
      leading: (item) {
        if (item.isDone) {
          return Icon(Icons.check_box);
        }
        return Icon(Icons.check_box_outline_blank);
      },
      title: (item) => Text(item.title),
      subtitle: (item) => Text(item.timestamp.toString()),
      trailing: (item) => Text(item.itemName()),
      onTap: (item) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecordConstants.recordInfo
                .where((ref) => ref.name == item.itemName())
                .first
                .edit(item)!,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ItemForm(
      item: resource,
      isNew: widget.isNew,
      title: resourceName,
      firstTab: _buildFields(),
      secondTab: buildRecords(context),
    );
  }
}
