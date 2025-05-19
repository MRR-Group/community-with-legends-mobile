import 'package:community_with_legends_mobile/src/shared/domain/models/navbar_pages.dart';
import 'package:flutter/cupertino.dart';

class NavbarController extends ChangeNotifier {
  NavbarPages get selectedPage => _selectedPage;
  NavbarPages _selectedPage = NavbarPages.feed;

  void selectPage(BuildContext context, NavbarPages page){
    _selectedPage = page;

    Navigator.of(context).pushReplacementNamed(page.routeName);
    notifyListeners();
  }
}
