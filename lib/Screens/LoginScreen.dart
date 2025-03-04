import 'package:community_with_legends_mobile/Widgets/BackgroundImage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.hasBottomNavigationBar});

  final bool? hasBottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    double bottomMargin;
    hasBottomNavigationBar == false ? bottomMargin = 0 : bottomMargin = 50;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(bottomMargin: bottomMargin),
        ],
      ),
    );
  }
}
