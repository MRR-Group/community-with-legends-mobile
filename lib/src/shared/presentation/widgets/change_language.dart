import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/localization_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final localizationController = Provider.of<LocalizationController>(context);

    localizationController.loadLocale();

    final locale = localizationController.locale;
    final languages = localizationController.languages;

    final selectedLanguage = languages.firstWhere(
      (test) => test.$2 == locale.languageCode,
    );

    return Column(
      children: [
        ListTile(
          title: Text(localizations.selectLanguage),
          textColor: textColor,
          onTap: () {},
        ),
        DefaultDropdownSearch(
          items: (filter, infiniteScrollProps) => <(String, String)>[
            ('Polski', 'pl'),
            ('English', 'en'),
          ],
          showSearchBox: false,
          selectedItem: selectedLanguage,
          searchBoxHint: '',
          compareFn: (item1, item2) => item1.$2 == item2.$2,
          keyToString: (key) => key?.$1 ?? '',
          onChanged: (language) {
            if (language == null) {
              return;
            }

            final localeCode = language.$2;
            localizationController.setLocale(localeCode);
          },
        ),
      ],
    );
  }
}
