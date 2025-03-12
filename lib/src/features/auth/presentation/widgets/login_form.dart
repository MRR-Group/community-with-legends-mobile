import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/presentation/widgets/button.dart';
import '../controllers/login_controller.dart';
import 'auth_text_input.dart';
import 'auth_via_twitch.dart';
import 'clickable_auth_text.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            "Log in",
            style: TextStyle(
              fontSize: 42,
            ),
          ),
          SizedBox(height: 18),
          AuthTextInput(
            text: "Enter your email",
            hint: 'Email',
            controller: emailController,
          ),
          ClickableAuthText(
            message: "You don't have an account?",
            linkText: "Click here",
            actionText: "to register",
            onPress: () =>
                Navigator.of(context)
                    .pushNamed('/register'),
          ),
          SizedBox(height: 18),
          AuthTextInput(
            text: "Enter your password",
            hint: 'Password',
            obscureText: true,
            controller: passwordController,
          ),
          ClickableAuthText(
              message: "You don't remember?",
              linkText: "Click here",
              actionText: "to reset it",
              onPress: () =>
              {
                print("Wcisnieto przycisk zapomniałeś hasła")
              }),
          SizedBox(height: 18),
          Button(
              text: "Log in",
              onPressed: () {
                if (!controller.isLoading) {
                  controller.login(
                      context, emailController.text, passwordController.text);
                }
              },
              isLoading: controller.isLoading),
          SizedBox(height: 18),
          AuthViaTwitch(authMode: AuthMode.login),
        ],
      ),
    );
  }
}