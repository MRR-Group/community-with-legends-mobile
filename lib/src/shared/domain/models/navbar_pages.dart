enum NavbarPages { feed, following, notification, profile }


extension NavbarPagesExtension on NavbarPages {
  String get routeName {
    switch (this) {
      case NavbarPages.feed:
        return '/feed';
      case NavbarPages.following:
        return '/following';
      case NavbarPages.notification:
        return '/notification';
      case NavbarPages.profile:
        return '/profile';
    }
  }
}
