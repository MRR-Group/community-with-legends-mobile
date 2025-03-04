import 'package:community_with_legends_mobile/Widgets/auth/AuthAppBar.dart';
import 'package:community_with_legends_mobile/Widgets/BackgroundImage.dart';
import 'package:community_with_legends_mobile/Widgets/auth/LoginViaTwitch.dart';
import 'package:flutter/material.dart';

import '../Widgets/Button.dart';
import '../Widgets/auth/RegisterLink.dart';
import '../Widgets/auth/ResetPasswordLink.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.hasBottomNavigationBar});

  final bool? hasBottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    double bottomMargin;
    hasBottomNavigationBar == false ? bottomMargin = 0 : bottomMargin = 50;

    return Scaffold(
      appBar: AuthAppBar(),
      body: Stack(
        children: [
          BackgroundImage(bottomMargin: bottomMargin),
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
                height: 550,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
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
                          TextFormField(
                            style: TextStyle(color: Color(0xFFB9B9BA)),
                            decoration: const InputDecoration(
                              constraints: BoxConstraints(maxHeight: 40),
                              contentPadding: EdgeInsets.all(12),
                              hintText: 'Email',
                              fillColor: Color(0xFF212023),
                              filled: true,
                              label: Text(
                                "Enter your email",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          RegisterLink(),
                          SizedBox(height: 18),
                          TextFormField(
                            style: TextStyle(color: Color(0xFFB9B9BA)),
                            obscureText: true,
                            decoration: const InputDecoration(
                              constraints: BoxConstraints(maxHeight: 40),
                              contentPadding: EdgeInsets.all(12),
                              hintText: 'Password',
                              fillColor: Color(0xFF212023),
                              filled: true,
                              label: Text(
                                "Enter your password",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          ResetPasswordLink(),
                          SizedBox(height: 18),
                          Button(text: "Log in"),
                          SizedBox(height: 18),
                          LoginViaTwitch(),
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
