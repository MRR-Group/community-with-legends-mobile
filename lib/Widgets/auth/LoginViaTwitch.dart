import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LoginViaTwitch extends StatelessWidget {
  const LoginViaTwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Text(
            "OR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          Text(
            "Log in via",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          SizedBox(height: 18),
          Image(image: Svg('lib/Assets/Images/twitch.svg')),
        ],
      );
  }
}
