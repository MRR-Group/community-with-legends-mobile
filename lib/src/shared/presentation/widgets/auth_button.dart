import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/select_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final authController = Provider.of<AuthController>(context);
    final userController = Provider.of<UserController>(context);

    return FutureBuilder<bool>(
      future: authController.isLoggedIn,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingAnimation(
            width: 20,
            height: 20,
          );
        }

        if (snapshot.data ?? false) {
          return SelectButton(
            text: localizations.logout_button,
            onPressed: () {
              authController.logout(context);
              userController.clearUser();
            },
            isSelected: true,
            fontSize: 24,
          );
        } else {
          return SelectButton(
            text: localizations.login_button,
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            isSelected: true,
            fontSize: 24,
          );
        }
      },
    );
  }
}
