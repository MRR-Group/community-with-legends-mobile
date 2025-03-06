import 'package:community_with_legends_mobile/Widgets/auth/auth_app_bar.dart';
import 'package:community_with_legends_mobile/Widgets/background_image.dart';
import 'package:community_with_legends_mobile/Widgets/auth/auth_via_twitch.dart';
import 'package:flutter/material.dart';

import '../Widgets/button.dart';
import '../Widgets/auth/auth_text_input.dart';
import '../Widgets/auth/clickable_auth_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    physics: ScrollPhysics(parent: PageScrollPhysics()),
                    children: [
                      Column(
                        children: [
                          Text(
                            "Log in",
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
                          ClickableAuthText(
                            message: "You don't have an account?",
                            linkText: "Click here",
                            actionText: "to register",
                            onPress: () =>
                                Navigator.of(context).pushNamed('/register'),
                          ),
                          SizedBox(height: 18),
                          AuthTextInput(
                            text: "Enter your password",
                            hint: 'Password',
                            obscureText: true,
                          ),
                          ClickableAuthText(
                            message: "You don't remember?",
                            linkText: "Click here",
                            actionText: "to reset it",
                            onPress: () =>
                                Navigator.of(context).pushNamed('/login'),
                          ),
                          SizedBox(height: 18),
                          Button(text: "Log in"),
                          SizedBox(height: 18),
                          AuthViaTwitch(authMode: AuthMode.login),
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
