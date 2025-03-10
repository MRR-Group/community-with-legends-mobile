import 'dart:convert';

import 'package:community_with_legends_mobile/Widgets/auth/auth_app_bar.dart';
import 'package:community_with_legends_mobile/Widgets/background_image.dart';
import 'package:community_with_legends_mobile/Widgets/auth/auth_via_twitch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/button.dart';
import '../Widgets/auth/auth_text_input.dart';
import '../Widgets/auth/clickable_auth_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final String _apiURL = dotenv.env['API_URL']!;

  _login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login in progress")));

      setState(() {
        _isLoading = true;
      });

      var url = Uri.parse('$_apiURL/api/auth/login');

      Map<String, String> body = {
        'email': _emailController.text,
        'password': _passwordController.text,
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      http.Response response;
      try {
        response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(body),
        );
        var responseBody = jsonDecode(response.body);

        if (response.statusCode == 200) {
          String token = responseBody['token'];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);

          if (mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Logged in")));
          }
        } else {
          String message = responseBody['message'];

          if (mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login failed: $message")));
          }
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "An unexpected error occurred. Please try again later")));
        }
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

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
                height: 670,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    physics: ScrollPhysics(parent: PageScrollPhysics()),
                    children: [
                      Form(
                        key: _formKey,
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
                            AuthTextInput(
                              text: "Enter your email",
                              hint: 'Email',
                              controller: _emailController,
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
                              controller: _passwordController,
                            ),
                            ClickableAuthText(
                                message: "You don't remember?",
                                linkText: "Click here",
                                actionText: "to reset it",
                                onPress: () => {
                                      print(
                                          "Wcisnieto przycisk zapomniałeś hasła")
                                    }),
                            SizedBox(height: 18),
                            Button(
                                text: "Log in",
                                onPressed: _login,
                                isLoading: _isLoading),
                            SizedBox(height: 18),
                            AuthViaTwitch(authMode: AuthMode.login),
                          ],
                        ),
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
