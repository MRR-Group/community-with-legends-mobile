import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/localization_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_search_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          title: const Text('Search user'),
          textColor: textColor,
          onTap: () {},
        ),
        DefaultDropdownSearch<User>(
          overrideSelectedItemTitle: true,
          listTitle: 'Search user',
          showSearchBox: true,
          searchBoxHint: 'Search user',
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
            }
          },
        ),
      ],
    );
  }
}
