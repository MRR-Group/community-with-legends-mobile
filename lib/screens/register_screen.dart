import 'dart:convert';

import 'package:community_with_legends_mobile/Widgets/auth/auth_app_bar.dart';
import 'package:community_with_legends_mobile/Widgets/background_image.dart';
import 'package:community_with_legends_mobile/Widgets/auth/auth_via_twitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../Widgets/button.dart';
import '../Widgets/auth/auth_text_input.dart';
import '../Widgets/auth/clickable_auth_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
  final String _apiURL = dotenv.env['API_URL']!;

  _register() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration in progress")));

      setState(() {
        _isLoading = true;
      });


      if (_confirmPasswordController.text != _passwordController.text) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registration failed: passwords are not the same")));

        setState(() {
          _isLoading = false;
        });

        return;
      }

      var url = Uri.parse('$_apiURL/api/auth/register');

      Map<String, String> body = {
        'email': _emailController.text,
        'name': _nameController.text,
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
          if (mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Registration completed successfully")));
              Navigator.of(context).pushNamed('/login');
          }
        } else {
          String message = responseBody['message'];

          if (mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Registration failed: $message")));
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
              child: SizedBox(
                width: 300,
                height: 800,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
                  child: ListView(
                    physics: ScrollPhysics(parent: PageScrollPhysics()),
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 42,
                              ),
                            ),
                            SizedBox(height: 18),
                            AuthTextInput(
                              text: "Enter your email",
                              hint: 'Email',
                              controller: _emailController,
                            ),
                            SizedBox(height: 18),
                            AuthTextInput(
                              text: "Enter your name",
                              hint: 'Name',
                              controller: _nameController,
                            ),
                            SizedBox(height: 18),
                            AuthTextInput(
                              text: "Enter your password",
                              hint: 'Password',
                              obscureText: true,
                              controller: _passwordController,
                            ),
                            SizedBox(height: 18),
                            AuthTextInput(
                              text: "Confirm your password",
                              hint: 'Confirm password',
                              obscureText: true,
                              controller: _confirmPasswordController,
                            ),
                            ClickableAuthText(
                              message: "You have an account?",
                              linkText: "Click here",
                              actionText: "to login",
                              onPress: () =>
                                  Navigator.of(context).pushNamed('/login'),
                            ),
                            SizedBox(height: 18),
                            Button(
                              text: "Register",
                              onPressed: _register,
                              isLoading: _isLoading,
                            ),
                            SizedBox(height: 18),
                            AuthViaTwitch(authMode: AuthMode.register),
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
