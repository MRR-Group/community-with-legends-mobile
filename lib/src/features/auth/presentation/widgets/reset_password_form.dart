import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/reset_password_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_text_input.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController tokenController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;

  const ResetPasswordForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.tokenController,
    required this.passwordController,
    required this.passwordConfirmationController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ResetPasswordController>(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            'Reset your password',
            style: TextStyle(
              fontSize: 42,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: 'Enter your email',
            hint: 'Email',
            controller: emailController,
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: 'Enter token',
            hint: 'Token',
            controller: tokenController,
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: 'Enter password',
            hint: 'Password',
            controller: passwordController,
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: 'Confirm password',
            hint: 'Password',
            controller: passwordConfirmationController,
          ),
          const SizedBox(height: 18),
          ClickableAuthText(
            message: "You don't have a reset token?",
            linkText: 'Click here',
            actionText: 'to get one',
            onPress: () => Navigator.of(context).pushNamed('/register'),
          ),
          const SizedBox(height: 18),
          ClickableAuthText(
            message: 'Did you remember your password?',
            linkText: 'Click here',
            actionText: 'to log in',
            onPress: () => Navigator.of(context).pushNamed('/login'),
          ),
          const SizedBox(height: 18),
          Button(
            text: 'Reset password',
            onPressed: () {
              if (!controller.isLoading) {
                controller.resetPassword(
                  context: context,
                  email: emailController.text,
                  token: tokenController.text,
                  password: passwordController.text,
                  passwordConfirmation: passwordConfirmationController.text,
                );
              }
            },
            isLoading: controller.isLoading,
          ),
        ],
      ),
    );
  }
}
