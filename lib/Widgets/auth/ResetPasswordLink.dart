import 'package:flutter/material.dart';

class ResetPasswordLink extends StatelessWidget {
  const ResetPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "You don't remember?",
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            print("Reset password");
          },
          child: Column(
            children: [
              Text(
                "Click here",
                style: TextStyle(color: Colors.purple, fontSize: 10),
              ),
              Text(
                "to reset it",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
