import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownGameSearch extends StatelessWidget {
  const DropdownGameSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      selectedItem: 'Select game',
      items: (filter, infiniteScrollProps) async {
        return [
          'League of Legends',
          'R.E.P.O',
          'Counter Strike 2',
          'Supermarket Together',
        ];
      },
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
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
            selectedItem!,
            style: const TextStyle(
              color: textDisabledColor,
              fontSize: 15,
            ),
          ),
        );
      },
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: const TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search game...',
            fillColor: backgroundLightColor,
            filled: true,
            border: OutlineInputBorder()
          ),
        ),
        itemBuilder: (context, item, isDisabled, isSelected) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            title: Text(
              item,
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
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
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
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
                      color: backgroundLightColor
                    ),
                    child: popupWidget,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      onChanged: (value) {
        print('Wybrano: $value');
      },
    );
  }
}
