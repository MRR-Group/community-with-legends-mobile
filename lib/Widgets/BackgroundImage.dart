import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.bottomMargin});

  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      child: Stack(
        children: [
          Image(
            image: AssetImage('lib/Assets/Images/background.png'),
            height: double.infinity,
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerRight,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.125, 1.0],
                colors: [
                  Color(0xFF181719),
                  Color(0xFF181719),
                  Color(0x001B2838),
                ],
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

}