import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/navbar_pages.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavbarButton extends StatelessWidget {
  final NavbarPages navbarPage;
  final IconData icon;
  final String buttonText;

  const NavbarButton({
    super.key,
    required this.navbarPage,
    required this.icon,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final navbarController = Provider.of<NavbarController>(context);

    return InkWell(
      onTap: () {
        navbarController.selectPage(context, navbarPage);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: _getButtonColor(
              currentPage: navbarPage,
              selectedPage: navbarController.selectedPage,
            ),
          ),
          Text(buttonText),
        ],
      ),
    );
  }

  Color _getButtonColor({
    required NavbarPages currentPage,
    required NavbarPages selectedPage,
  }) =>
      currentPage == selectedPage ? primaryColor : textColor;
}
