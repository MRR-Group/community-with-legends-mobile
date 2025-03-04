import 'package:community_with_legends_mobile/Widgets/auth/AuthAppBar.dart';
import 'package:community_with_legends_mobile/Widgets/BackgroundImage.dart';
import 'package:community_with_legends_mobile/Widgets/auth/LoginViaTwitch.dart';
import 'package:community_with_legends_mobile/Widgets/auth/PasswordInput.dart';
import 'package:flutter/material.dart';

import '../Widgets/Button.dart';
import '../Widgets/auth/EmailInput.dart';
import '../Widgets/auth/RegisterLink.dart';
import '../Widgets/auth/ResetPasswordLink.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
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

                          EmailInput(),
                          RegisterLink(),

                          SizedBox(height: 18),

                          PasswordInput(),
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
