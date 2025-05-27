import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/user_menu_button.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final User userProfile;

  const UserDetails({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      width: 500,
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          ProfileCard(
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: UserMenuButton(
                      user: userProfile,
                      parentContext: context,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                userProfile.name,
                                style: const TextStyle(
                                  fontSize: 50,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                userProfile.email,
                                style: const TextStyle(fontSize: 30),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Text('${localizations.profile_following}: 0'),
                                  const Spacer(),
                                  Text('${localizations.profile_followers}: 0'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 100,
              child: Image.asset(
                'assets/images/loading.gif',
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
