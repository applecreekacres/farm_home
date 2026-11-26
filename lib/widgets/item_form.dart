import 'package:farm_home/models/models.dart';
import 'package:farm_home/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class ItemForm<T extends Item> extends ConsumerStatefulWidget {
  final T? item;
  final bool isNew;
  final List<Widget> firstTab;
  final Widget secondTab;
  final String title;

  const ItemForm({
    super.key,
    this.item,
    required this.isNew,
    required this.title,
    required this.firstTab,
    required this.secondTab,
  });

  @override
  ConsumerState<ItemForm<T>> createState() => _ItemFormState<T>();
}

class _ItemFormState<T extends Item> extends ConsumerState<ItemForm<T>> {
  final _formKey = GlobalKey<FormState>();
  bool _busy = false;

  T? get item => widget.item;
  List<Widget> get edit => widget.firstTab;
  String? get itemName => item?.itemName();

  Future<void> _save() async {
    final current = item;
    if (_busy || current == null) {
      return;
    }
    setState(() => _busy = true);
    try {
      await ref.saveItem(current, isNew: widget.isNew);
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop();
    } catch (_) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not save this item.')),
      );
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<void> _delete() async {
    final current = item;
    if (_busy || current == null) {
      return;
    }
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _busy = true);
    try {
      await ref.deleteItem(current);
      navigator.pop();
      navigator.pop();
    } catch (_) {
      if (!mounted) {
        return;
      }
      navigator.pop();
      messenger.showSnackBar(
        const SnackBar(content: Text('Could not delete this item.')),
      );
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  List<Widget> getActions(BuildContext context) {
    var actions = [
      IconButton(onPressed: _busy ? null : _save, icon: const Icon(Icons.save)),
    ];

    if (!widget.isNew) {
      actions.add(
        IconButton(
          onPressed: _busy
              ? null
              : () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete?"),
                        content: const Text(
                          "Are you sure you want to delete this item? There is no reversing this action.",
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            onPressed: _delete,
                            child: const Text('Delete'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
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
                Tab(icon: Icon(Icons.edit_document)),
                Tab(icon: Icon(Icons.notes)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: edit),
                ),
              ),
              Container(child: widget.secondTab),
            ],
          ),
        ),
      ),
    );
  }
}
