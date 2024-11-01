import 'package:flutter/material.dart';

import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:farm_home/constants/constants.dart';

class SearchSelection<T> extends StatefulWidget {
  final String? hintText;
  final String title;
  final List<T> items;
  final String Function(T) fieldToCheck;
  final Widget Function(T, int, bool) itemView;
  final Widget Function(T) pickedItemView;
  final void Function(T)? onItemRemoved;
  final void Function()? onTapClearAll;
  final void Function(List<T>)? onPickedChange;
  final bool sortShowedItems;
  final bool sortPickedItems;
  final bool clearSearchFieldOnSelect;
  final bool showSelectAllButton;
  final int? maxSelectedItems;

  const SearchSelection({
    super.key,
    required this.title,
    required this.items,
    required this.fieldToCheck,
    required this.itemView,
    required this.pickedItemView,
    this.onItemRemoved,
    this.onTapClearAll,
    this.onPickedChange,
    this.hintText,
    this.maxSelectedItems,
    this.sortShowedItems = true,
    this.sortPickedItems = true,
    this.clearSearchFieldOnSelect = true,
    this.showSelectAllButton = false,
  });

  @override
  State<SearchSelection> createState() => _SearchSelectionState<T>();
}

class _SearchSelectionState<T> extends State<SearchSelection> {
  MultipleSearchController controller = MultipleSearchController(
    minCharsToShowItems: 3,
    allowDuplicateSelection: false,
  );

  @override
  Widget build(BuildContext context) {
    return MultipleSearchSelection<T>(
      items: widget.items as List<T>,
      controller: controller,
      maxSelectedItems: widget.maxSelectedItems,
      sortShowedItems: widget.sortShowedItems,
      sortPickedItems: widget.sortPickedItems,
      caseSensitiveSearch: false,
      clearSearchFieldOnSelect: widget.clearSearchFieldOnSelect,
      fuzzySearch: FuzzySearch.none,
      showSelectAllButton: widget.showSelectAllButton,
      maximumShowItemsHeight: 200,
      searchField: TextField(
        decoration: InputDecoration(
          hintText: widget.hintText,
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
      itemsVisibility: ShowedItemsVisibility.onType,
      title: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(widget.title),
      ),
      onItemAdded: (c) {
        controller.getAllItems();
        controller.getPickedItems();
      },
      fieldToCheck: (c) {
        return widget.fieldToCheck.call(c);
      },
      itemBuilder: (item, index, isPicked) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: widget.itemView(item, index, isPicked),
            ),
          ),
        );
      },
      pickedItemBuilder: (item) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: widget.pickedItemView(item),
          ),
        );
      },
      selectAllButton: Padding(
        padding: const EdgeInsets.all(12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: farmHomeTheme.primaryColor),
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
      onItemRemoved: (data) {
        widget.onItemRemoved?.call(data);
      },
      onTapClearAll: () => widget.onTapClearAll?.call(),
      onPickedChange: (items) {
        widget.onPickedChange?.call(items);
      },
    );
  }
}
