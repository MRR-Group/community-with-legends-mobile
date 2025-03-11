import 'package:flutter/material.dart';
import '../config/colors.dart';

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
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
            ),
            border: Border.all(
              width: 1.0,
              color: Colors.transparent,
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: backgroundColor),
            child: Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, overflow: TextOverflow.visible),
              ),
            ),
          ),
        ),
        duration: Duration(seconds: 5),
      ),
    );
  }
}
