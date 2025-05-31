import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_via_twitch.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/text_input_field.dart';
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
    final controller = Provider.of<AuthController>(context);
    final userController = Provider.of<UserController>(context);
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            localizations.login_title,
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
          ClickableAuthText(
            message: localizations.login_noAccount,
            linkText: localizations.clickHere,
            actionText: localizations.login_registerCta,
            onPress: () => Navigator.of(context).pushNamed('/register'),
          ),
          const SizedBox(height: 18),
          TextInputField(
            text: localizations.passwordHint,
            hint: localizations.password,
            obscureText: true,
            controller: passwordController,
          ),
          ClickableAuthText(
            message: localizations.login_dontRemember,
            linkText: localizations.clickHere,
            actionText: localizations.login_resetPasswordCta,
            onPress: () => Navigator.of(context).pushNamed('/forgot-password'),
          ),
          const SizedBox(height: 18),
          Button(
            text: localizations.login_button,
            onPressed: () {
              if (!controller.isLoading) {
                controller.login(
                  context: context,
                  email: emailController.text,
                  password: passwordController.text,
                  onLoginSuccess: () {
                    userController.refreshUser();
                  },
                );
              }
            },
            isLoading: controller.isLoading,
          ),
          const SizedBox(height: 18),
          AuthViaTwitch(authMode: AuthMode.login),
          const SizedBox(height: 18),
          Button(
            text: localizations.login_viewAsGuest,
            onPressed: () {
              Navigator.pushNamed(context, '/feed');
            },
            isLoading: controller.isLoading,
          ),
        ],
      ),
    );
  }
}
