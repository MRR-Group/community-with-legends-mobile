import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "You don't have account?",
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            print("Register");
          },
          child: Column(
            children: [
              Text(
                "Click here",
                style: TextStyle(color: Colors.purple, fontSize: 10),
              ),
              Text(
                "to register",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
