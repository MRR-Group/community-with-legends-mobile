import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  final User userProfile;

  const EditProfile({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final localizations = AppLocalizations.of(context)!;
    final TextEditingController usernameController = TextEditingController();
    final profileController = Provider.of<ProfileController>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      width: 500,
      alignment: Alignment.topCenter,
      child: ProfileCard(
        child: Form(
          key: formKey,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50,
                          child: ClipOval(
                            child: Image.network(
                              userProfile.avatarUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Button(
                            text: localizations.profile_deleteAvatar,
                            onPressed: () {},
                          ),
                          Button(
                            text: localizations.profile_uploadAvatar,
                            onPressed: () => profileController
                                .pickAvatar(ImageSource.gallery),
                          ),
                          Button(
                            text: localizations.profile_takePhoto,
                            onPressed: () => profileController
                                .pickAvatar(ImageSource.camera),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextInputField(
                        hint: userProfile.name,
                        text: localizations.nickname,
                        controller: usernameController,
                        fillColor: backgroundColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      const Spacer(),
                      Button(
                        text: localizations.cancel,
                        onPressed: () {
                          profileController.closeUserEditMenu();
                        },
                      ),
                      Button(
                        text: localizations.save,
                        onPressed: () => _onSaveButtonClick(
                          profileController,
                          context,
                          usernameController.value.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSaveButtonClick(
    ProfileController profileController,
    BuildContext context,
    String nickname,
  ) async {
    final result = await profileController.changeNickname(context, nickname);

    Alert.of(context).show(
      text: result,
    );
  }
}
