import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_text_input.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_via_twitch.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/clickable_auth_text.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final localizations = AppLocalizations.of(context)!;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            localizations.loginTitle,
            style: const TextStyle(
              fontSize: 42,
            ),
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: localizations.loginEmailHint,
            hint: localizations.email,
            controller: emailController,
          ),
          ClickableAuthText(
            message: localizations.loginNoAccount,
            linkText: localizations.loginClickHere,
            actionText: localizations.loginRegisterCta,
            onPress: () => Navigator.of(context).pushNamed('/register'),
          ),
          const SizedBox(height: 18),
          AuthTextInput(
            text: localizations.loginPasswordHint,
            hint: localizations.password,
            obscureText: true,
            controller: passwordController,
          ),
          ClickableAuthText(
            message: localizations.loginDontRemember,
            linkText: localizations.loginClickHere,
            actionText: localizations.loginResetPasswordCta,
            onPress: () => Navigator.of(context).pushNamed('/forgot-password'),
          ),
          const SizedBox(height: 18),
          Button(
            text: localizations.loginButton,
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
          AuthViaTwitch(authMode: AuthMode.login),
          const SizedBox(height: 18),
          Button(
            text: localizations.loginViewAsGuest,
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
