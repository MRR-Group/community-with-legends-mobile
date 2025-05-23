import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/auth_button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/change_language.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/search_user_dropdown.dart';
import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border.all(
        color: primaryColor,
      ),
      backgroundColor: backgroundColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: textDisabledColor),
              ),
            ),
            child: Image.asset('assets/images/logo.png'),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  child: const ChangeLanguage(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  child: const SearchUserDropdown(),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: textDisabledColor),
              ),
            ),
            child: const Align(
              child: AuthButton(),
            ),
          ),
        ],
      ),
    );
  }
}
