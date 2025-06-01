import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetPasswordOption extends StatelessWidget {
  const SetPasswordOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final userController = Provider.of<UserController>(context);
    final user = userController.user;

    if(user != null && !user.hasPassword){
      return Column(
        children: [
          ListTile(
            title: Text(localizations.setPasswordTitle),
            textColor: textColor,
            onTap: () {},
          ),
          Button(
            text: localizations.setPasswordButton,
            onPressed: () {},
          ),
        ],
      );
    }

    return Container();
  }
}
