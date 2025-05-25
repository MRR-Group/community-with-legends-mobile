import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class DefaultPopupMenuItem {
  static PopupMenuItem<String> build({
    required String value,
    required IconData icon,
    required String label,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              label,
              style: const TextStyle(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
