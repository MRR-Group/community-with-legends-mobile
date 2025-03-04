import 'package:community_with_legends_mobile/Widgets/BackgroundImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../Widgets/Button.dart';

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
          Center(
            heightFactor: 100,
            widthFactor: 100,
            child: Card(
              color: Color(0xff181719),
              child: SizedBox(
                width: 300,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            "Enter your email",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Spacer(),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'Email'),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            "You don't have account?",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "Click here",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "to register",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Enter your password",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Spacer(),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'Password'),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            "You don't have account?",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "Click here",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "to register",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Button(text: "Log in"),
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
                        ],
                      ),
                      Image(image: Svg('lib/Assets/Images/twitch.svg'))
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
