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
                  child: Column(
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
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
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
                                  color: Colors.purple,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "to register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      TextFormField(
                        style: TextStyle(color: Color(0xFFB9B9BA)),
                        decoration: const InputDecoration(
                          constraints: BoxConstraints(maxHeight: 40),
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Password',
                          fillColor: Color(0xFF212023),
                          filled: true,
                          label: Text(
                            "Enter your password",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
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
                                  color: Colors.purple,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "to register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Button(text: "Log in"),
                      SizedBox(height: 18),
                      Column(
                        children: [
                          Text(
                            "OR",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          Text(
                            "Log in via",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Image(image: Svg('lib/Assets/Images/twitch.svg')),
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
