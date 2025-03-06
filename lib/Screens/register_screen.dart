import 'package:community_with_legends_mobile/Widgets/auth/AuthAppBar.dart';
import 'package:community_with_legends_mobile/Widgets/BackgroundImage.dart';
import 'package:community_with_legends_mobile/Widgets/auth/AuthViaTwitch.dart';
import 'package:flutter/material.dart';

import '../Widgets/Button.dart';
import '../Widgets/auth/AuthTextInput.dart';
import '../Widgets/auth/ClickableAuthText.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AuthAppBar(),
      body: Stack(
        children: [
          BackgroundImage(bottomMargin: 0),
          Center(
            heightFactor: 100,
            widthFactor: 100,
            child: Card(
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFA4C1C9), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              color: Color(0xff181719),
              child: SizedBox(
                width: 300,
                height: 650,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    physics: ScrollPhysics(parent: PageScrollPhysics()),
                    children: [
                      Column(
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 42,
                              color: Color(0xFFFDFEFE),
                            ),
                          ),
                          SizedBox(height: 18),
                          AuthTextInput(
                            text: "Enter your email",
                            hint: 'Email',
                          ),
                          SizedBox(height: 18),
                          AuthTextInput(
                            text: "Enter your name",
                            hint: 'Name',
                          ),
                          SizedBox(height: 18),
                          AuthTextInput(
                            text: "Enter your password",
                            hint: 'Password',
                            obscureText: true,
                          ),
                          SizedBox(height: 18),
                          AuthTextInput(
                            text: "Confirm your password",
                            hint: 'Confirm password',
                            obscureText: true,
                          ),
                          ClickableAuthText(
                            message: "You have an account?",
                            linkText: "Click here",
                            actionText: "to login",
                            onPress: () =>
                                Navigator.of(context).pushNamed('/login')
                            ,
                          ),
                          SizedBox(height: 18),
                          Button(text: "Register"),
                          SizedBox(height: 18),
                          AuthViaTwitch(authMode: AuthMode.register),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
