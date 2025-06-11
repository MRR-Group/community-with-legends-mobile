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

class EditProfile extends StatefulWidget {
  final User userProfile;

  const EditProfile({super.key, required this.userProfile});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final TextEditingController usernameController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
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
                        padding: const EdgeInsets.only(right: 16),
                        child: CircleAvatar(
                          radius: 50,
                          child: ClipOval(
                            child: Image.network(
                              widget.userProfile.avatarUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Button(
                            text: localizations.profile_uploadAvatar,
                            onPressed: () => _onUploadAvatarClick(
                              profileController,
                              context,
                            ),
                          ),
                          Button(
                            text: localizations.profile_deleteAvatar,
                            onPressed: () => _onDeleteAvatarClick(
                              profileController,
                              context,
                            ),
                          ),
                          Button(
                            text: localizations.profile_takePhoto,
                            onPressed: () => _onTakePhotoClick(
                              profileController,
                              context,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 175,
                        child: TextInputField(
                          hint: widget.userProfile.name,
                          text: localizations.nickname,
                          controller: usernameController,
                          fillColor: backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 37),
                        child: Button(
                          text: localizations.change,
                          onPressed: () => _onSaveButtonClick(
                            profileController,
                            context,
                            usernameController.value.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Button(
                    text: localizations.done,
                    onPressed: () {
                      profileController.closeUserEditMenu();
                    },
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

  Future<void> _onUploadAvatarClick(
    ProfileController profileController,
    BuildContext context,
  ) async {
    final result = await profileController.pickAvatar(
      context,
      ImageSource.gallery,
    );

    if (result != null) {
      Alert.of(context).show(
        text: result,
      );
    }
  }

  Future<void> _onTakePhotoClick(
    ProfileController profileController,
    BuildContext context,
  ) async {
    final result = await profileController.pickAvatar(
      context,
      ImageSource.camera,
    );

    if (result != null) {
      Alert.of(context).show(
        text: result,
      );
    }
  }

  Future<void> _onDeleteAvatarClick(
    ProfileController profileController,
    BuildContext context,
  ) async {
    final result = await profileController.deleteAvatar(
      context,
    );

    Alert.of(context).show(
      text: result,
    );
  }
}
