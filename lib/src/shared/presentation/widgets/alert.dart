import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/main.dart';
import 'package:flutter/material.dart';

class Alert {
  final BuildContext? context;

  Alert.of(this.context);

  static void showGlobal({required String text, bool hideCurrent = false}) {
    final scaffoldMessenger = scaffoldMessengerKey.currentState;

    if (scaffoldMessenger == null) {
      return;
    }

    if (hideCurrent) {
      scaffoldMessenger.hideCurrentSnackBar();
    }

    scaffoldMessenger.showSnackBar(_snackBar(text));
  }

  void show({required String text, bool hideCurrent = false}) {
    final messenger = context != null
        ? ScaffoldMessenger.of(context!)
        : scaffoldMessengerKey.currentState;

    if (messenger == null) {
      return;
    }

    if (hideCurrent) {
      messenger.hideCurrentSnackBar();
    }

    messenger.showSnackBar(_snackBar(text));
  }

  static SnackBar _snackBar(String text) {
    return SnackBar(
      content: Container(
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: backgroundColor,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      duration: const Duration(seconds: 5),
    );
  }
}
