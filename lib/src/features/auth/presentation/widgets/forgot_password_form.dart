import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_text_input.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            localizations.fp_title,
            style: const TextStyle(
              fontSize: 42,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: localizations.emailHint,
            hint: localizations.email,
            controller: emailController,
          ),
          const SizedBox(height: 18),
          ClickableAuthText(
            message: localizations.fp_haveResetToken,
            linkText: localizations.clickHere,
            actionText: localizations.fp_resetPassword,
            onPress: () => Navigator.of(context).pushNamed('/reset-password'),
          ),
          const SizedBox(height: 18),
          ClickableAuthText(
            message: localizations.fp_rememberPassword,
            linkText: localizations.clickHere,
            actionText: localizations.fp_rememberPasswordCta,
            onPress: () => Navigator.of(context).pushNamed('/login'),
          ),
          const SizedBox(height: 18),
          Button(
            text: localizations.fp_button,
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
