import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;

  const SetPasswordForm({
    super.key,
    required this.formKey,
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
            localizations.setPasswordFormTitle,
            style: const TextStyle(
              fontSize: 42,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.password,
            hint: localizations.passwordHint,
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.confirmPassword,
            hint: localizations.confirmPasswordHint,
            controller: passwordConfirmationController,
            obscureText: true,
          ),
          const SizedBox(height: 18),
          Button(
            text: localizations.setPasswordButton,
            onPressed: () async {
              if (!controller.isLoading) {
                final result = await controller.setPassword(
                  context: context,
                  password: passwordController.text,
                  passwordConfirmation: passwordConfirmationController.text,
                );

                Alert.of(context).show(text: result);
              }
            },
            isLoading: controller.isLoading,
          ),
        ],
      ),
    );
  }
}
