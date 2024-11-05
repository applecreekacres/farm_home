import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class ItemForm<T extends Item> extends StatefulWidget {
  final T? item;
  final bool isNew;
  // final List<Widget> view;
  final List<Widget> editFields;
  final String title;

  const ItemForm(
      {super.key,
      this.item,
      required this.isNew,
      required this.title,
      required this.editFields});

  @override
  State<ItemForm> createState() => _ItemFormState<T>();
}

class _ItemFormState<T extends Item> extends State<ItemForm<T>> {
  final _formKey = GlobalKey<FormState>();
  T? get item => widget.item;
  List<Widget> get edit => widget.editFields;
  // List<Widget> get view => widget.view;
  String? get itemName => item?.itemName();

  List<Widget> getActions(BuildContext context) {
    var actions = [
      IconButton(
        onPressed: () {
          if (widget.isNew) {
            createItem<T>(item!);
          } else {
            updateItem<T>(item!);
          }
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.save),
      )
    ];

    if (!widget.isNew) {
      actions.add(
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Delete?"),
                  content: const Text(
                      "Are you sure you want to delete this item? There is no reversing this action."),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Delete'),
                      onPressed: () {
                        deleteItem(item!.id);
                        Navigator.of(context).pop(); // Close dialog
                        Navigator.of(context).pop(); // Close form page
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.delete),
        ),
      );
    }
    return actions;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(widget.title),
            actions: getActions(context),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.notes)),
                Tab(icon: Icon(Icons.add_chart)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: edit,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
