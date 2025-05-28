import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/text_input_field.dart';
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
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.emailHint,
            hint: localizations.email,
            controller: emailController,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.tokenHint,
            hint: localizations.token,
            controller: tokenController,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.password,
            hint: localizations.passwordHint,
            controller: passwordController,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.confirmPassword,
            hint: localizations.confirmPasswordHint,
            controller: passwordConfirmationController,
          ),
          const SizedBox(height: 18),
          ClickableAuthText(
            message: localizations.rp_noResetToken,
            linkText: localizations.clickHere,
            actionText: localizations.rp_noResetTokenCta,
            onPress: () => Navigator.of(context).pushNamed('/forgot-password'),
          ),
          const SizedBox(height: 18),
          ClickableAuthText(
            message: localizations.rp_rememberPassword,
            linkText: localizations.clickHere,
            actionText: localizations.rp_rememberPasswordCta,
            onPress: () => Navigator.of(context).pushNamed('/login'),
          ),
          const SizedBox(height: 18),
          Button(
            text: localizations.fp_button,
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
