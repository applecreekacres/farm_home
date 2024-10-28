import 'package:flutter/material.dart';

import 'package:farm_home/models/models.dart';

class ItemForm<T extends Item> extends StatefulWidget {
  final T? item;
  final bool isNew;
  // final List<Widget> view;
  final List<Widget> editFields;
  final String title;

  const ItemForm(
      {super.key, this.item, required this.isNew, required this.title, required this.editFields});

  @override
  State<ItemForm> createState() => _ItemFormState<T>();
}

class _ItemFormState<T extends Item> extends State<ItemForm<T>> {
  final _formKey = GlobalKey<FormState>();
  T? get item => widget.item;
  List<Widget> get edit => widget.editFields;
  // List<Widget> get view => widget.view;
  String? get itemName => item?.itemName();

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
            actions: [
              IconButton(
                  onPressed: () {
                    if (widget.isNew) {
                      createItem<T>(item!);
                    } else {
                      updateItem<T>(item!);
                    }
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.save))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.notes)),
                Tab(icon: Icon(Icons.add_chart)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: edit,
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
