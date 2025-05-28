import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_via_twitch.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context);
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            localizations.register_title,
            style: const TextStyle(
              fontSize: 42,
            ),
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.emailHint,
            hint: localizations.email,
            controller: emailController,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.nameHint,
            hint: localizations.name,
            controller: nameController,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.passwordHint,
            hint: localizations.password,
            obscureText: true,
            controller: passwordController,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.confirmPasswordHint,
            hint: localizations.confirmPassword,
            obscureText: true,
            controller: confirmPasswordController,
          ),
          ClickableAuthText(
            message: localizations.register_haveAccount,
            linkText: localizations.clickHere,
            actionText: localizations.register_haveAccountCta,
            onPress: () => Navigator.of(context).pushNamed('/login'),
          ),
          const SizedBox(height: 18),
          Button(
            text: localizations.register_button,
            onPressed: () {
              if (!controller.isLoading) {
                controller.register(
                  context,
                  emailController.text,
                  nameController.text,
                  passwordController.text,
                  confirmPasswordController.text,
                );
              }
            },
            isLoading: controller.isLoading,
          ),
          const SizedBox(height: 18),
          AuthViaTwitch(authMode: AuthMode.register),
        ],
      ),
    );
  }
}
