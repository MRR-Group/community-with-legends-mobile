import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/pages/profile_page.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_search_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUserDropdown extends StatelessWidget {
  const SearchUserDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final userSearchController = Provider.of<UserSearchController>(context);


    return Column(
      children: [
        ListTile(
          title: Text(localizations.su_searchUserProfile),
          textColor: textColor,
          onTap: () {},
        ),
        DefaultDropdownSearch<User>(
          overrideSelectedItemTitle: true,
          listTitle: localizations.su_selectUser,
          showSearchBox: true,
          searchBoxHint: localizations.su_search,
          compareFn: (item1, item2) => item1.id == item2.id,
          filterFn: (_, __) => true,
          keyToString: (key) => key?.name ?? '',
          items: (filter, infiniteScrollProps) async {
            final users = await userSearchController.searchUsersByName(
              context: context,
              filter: filter,
            );

            return users;
          },
          onChanged: (user) {
            if (user != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(userId: user.id),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
