import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class Alert {
  BuildContext context;

  Alert.of(this.context);

  void show({required String text, bool hideCurrent = true}) {
    if (hideCurrent) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
            ),
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          child: Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor,
            ),
            width: double.infinity,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
