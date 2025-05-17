import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_text_input.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  const ForgotPasswordForm({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            'Forgot your password?',
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
          ClickableAuthText(
            message: 'You already have a reset token?',
            linkText: 'Click here',
            actionText: 'to reset password',
            onPress: () => Navigator.of(context).pushNamed('/reset-password'),
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
            text: 'Send code',
            onPressed: () {
              if (!controller.isLoading) {
                controller.sendResetTokenEmail(
                  context,
                  emailController.text,
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
