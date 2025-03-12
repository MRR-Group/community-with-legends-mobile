import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/presentation/widgets/button.dart';
import 'auth_text_input.dart';
import 'auth_via_twitch.dart';
import 'clickable_auth_text.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterForm(
      {super.key,
      required this.emailController,
      required this.nameController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context);

    return Form(
      key: formKey,
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
            controller: emailController,
          ),
          SizedBox(height: 18),
          AuthTextInput(
            text: "Enter your name",
            hint: 'Name',
            controller: nameController,
          ),
          SizedBox(height: 18),
          AuthTextInput(
            text: "Enter your password",
            hint: 'Password',
            obscureText: true,
            controller: passwordController,
          ),
          SizedBox(height: 18),
          AuthTextInput(
            text: "Confirm your password",
            hint: 'Confirm password',
            obscureText: true,
            controller: confirmPasswordController,
          ),
          ClickableAuthText(
            message: "You have an account?",
            linkText: "Click here",
            actionText: "to login",
            onPress: () => Navigator.of(context).pushNamed('/login'),
          ),
          SizedBox(height: 18),
          Button(
            text: "Register",
            onPressed: () {
              if (!controller.isLoading) {
                controller.register(
                    context, emailController.text, nameController.text, passwordController.text, confirmPasswordController.text);
              }
            },
            isLoading: controller.isLoading,
          ),
          SizedBox(height: 18),
          AuthViaTwitch(authMode: AuthMode.register),
        ],
      ),
    );
  }
}
