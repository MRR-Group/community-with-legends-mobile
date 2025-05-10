import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/login_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_text_input.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_via_twitch.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            'Log in',
            style: TextStyle(
              fontSize: 42,
            ),
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: 'Enter your email',
            hint: 'Email',
            controller: emailController,
          ),
          ClickableAuthText(
            message: "You don't have an account?",
            linkText: 'Click here',
            actionText: 'to register',
            onPress: () => Navigator.of(context).pushNamed('/register'),
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: 'Enter your password',
            hint: 'Password',
            obscureText: true,
            controller: passwordController,
          ),
          ClickableAuthText(
            message: "You don't remember?",
            linkText: 'Click here',
            actionText: 'to reset it',
            onPress: () => Navigator.of(context).pushNamed('/forgot-password'),
          ),
          const SizedBox(height: 18),
          Button(
            text: 'Log in',
            onPressed: () {
              if (!controller.isLoading) {
                controller.login(
                  context,
                  emailController.text,
                  passwordController.text,
                );
              }
            },
            isLoading: controller.isLoading,
          ),
          const SizedBox(height: 18),
          const AuthViaTwitch(authMode: AuthMode.login),
        ],
      ),
    );
  }
}
