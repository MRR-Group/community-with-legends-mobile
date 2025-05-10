import 'dart:async';

import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DefaultDropdownSearch<T> extends StatelessWidget {
  const DefaultDropdownSearch({
    super.key,
    required this.items,
    this.selectedItem,
    required this.showSearchBox,
    required this.searchBoxHint,
    this.onChanged,
    this.overrideSelectedItemTitle = false,
    this.listTitle = '',
    required this.keyToString,
    this.compareFn,
    this.filterFn,
  });

  final FutureOr<List<T>> Function(String, LoadProps?)? items;
  final T? selectedItem;
  final bool showSearchBox;
  final String searchBoxHint;
  final void Function(T?)? onChanged;
  final bool overrideSelectedItemTitle;
  final String listTitle;
  final String Function(T?) keyToString;
  final bool Function(T, T)? compareFn;
  final bool Function(T, String)? filterFn;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      selectedItem: selectedItem,
      items: items,
      compareFn: compareFn,
      filterFn: filterFn,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      dropdownBuilder: (context, selectedItem) {
        return ListTile(
          title: Text(
            overrideSelectedItemTitle || keyToString(selectedItem).isEmpty
                ? listTitle
                : keyToString(selectedItem),
            style: const TextStyle(
              color: textDisabledColor,
              fontSize: 15,
            ),
          ),
        );
      },
      popupProps: PopupProps.menu(
        showSearchBox: showSearchBox,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: searchBoxHint,
            fillColor: backgroundLightColor,
            filled: true,
            border: const OutlineInputBorder(),
          ),
        ),
        itemBuilder: (context, item, isDisabled, isSelected) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            title: Text(
              keyToString(item),
              style: const TextStyle(
                color: textColor,
                fontSize: 15,
              ),
            ),
          );
        },
        menuProps: const MenuProps(
          backgroundColor: backgroundLightColor,
        ),
        containerBuilder: (ctx, popupWidget) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              gradient: primaryGradient,
            ),
            padding: const EdgeInsets.all(1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      color: backgroundLightColor,
                    ),
                    child: popupWidget,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      onChanged: onChanged,
    );
  }
}
