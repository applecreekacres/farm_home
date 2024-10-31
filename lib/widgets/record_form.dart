import 'package:farm_home/constants/constants.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';
import 'package:farm_home/widgets/widgets.dart';
import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:provider/provider.dart';

class RecordForm<T extends Record> extends StatefulWidget {
  final T record;
  final List<Widget>? additionalFields;
  final bool isNew;

  const RecordForm(
      {required this.record,
      required this.isNew,
      this.additionalFields,
      super.key});

  @override
  State<RecordForm> createState() => _RecordFormState<T>();
}

class _RecordFormState<T extends Record> extends State<RecordForm<T>> {
  T get record => widget.record;
  List<Widget> get fields => widget.additionalFields ?? List<Widget>.empty();
  String get itemName => record.itemName();

  MultipleSearchController controller = MultipleSearchController(
    minCharsToShowItems: 3,
    allowDuplicateSelection: false,
  );

  List<Widget> _buildFields() {
    var resProvider = Provider.of<ResourceProvider>(context);
    List<Widget> fields = [
      TextFormField(
          decoration: const InputDecoration(labelText: "Name"),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter a name' : null,
          onChanged: (value) => record.title = value),
      LabelledCheckbox(
        label: 'Done',
        value: record.isDone,
        onChanged: (value) {
          record.isDone = value!;
        },
      ),
      DateTimeTextField(
          labelText: 'Timestamp',
          firstDate: DateTime(1970),
          lastDate: DateTime(2100),
          value: record.timestamp,
          onChanged: (value) {
            record.timestamp = value!;
          },
          initialDate: DateTime.now()),
      NotesField(
        modelField: record.notes,
      ),
      FutureWidget(
          future: resProvider.resources,
          onData: (data) {
            return MultipleSearchSelection<Resource>(
              searchField: TextField(
                decoration: InputDecoration(
                  hintText: ResourceConstants.titlePlural,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  suffixIcon: IconButton(
                    onPressed: controller.clearSearchField,
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
              onSearchChanged: (text) {},
              controller: controller,
              itemsVisibility: ShowedItemsVisibility.onType,
              title: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  ResourceConstants.titlePlural,
                ),
              ),
              onItemAdded: (c) {
                controller.getAllItems();
                controller.getPickedItems();
              },
              clearSearchFieldOnSelect: true,
              items: data!,
              fieldToCheck: (c) {
                return c.name;
              },
              itemBuilder: (resource, index, isPicked) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 12),
                      child: Text(resource.name),
                    ),
                  ),
                );
              },
              pickedItemBuilder: (resource) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(resource.name),
                  ),
                );
              },
              sortShowedItems: true,
              sortPickedItems: true,
              selectAllButton: Padding(
                padding: const EdgeInsets.all(12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Select All'),
                  ),
                ),
              ),
              clearAllButton: Padding(
                padding: const EdgeInsets.all(12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Clear All'),
                  ),
                ),
              ),
              caseSensitiveSearch: false,
              fuzzySearch: FuzzySearch.none,
              showSelectAllButton: false,
              maximumShowItemsHeight: 200,
              onItemRemoved: (data) {
                record.resourceIds.remove(data.id);
              },
              onTapClearAll: () => record.resourceIds.clear(),
              onPickedChange: (items) {
                record.resourceIds = items.map((i) => i.id).toList();
              },
            );
          }),
    ];

    fields.addAll(this.fields);
    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return ItemForm(
      item: record,
      isNew: widget.isNew,
      title: "$itemName Record",
      editFields: _buildFields(),
    );
  }
}
