import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_profile_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/edit_profile_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/hardware_card_widget.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/user_details_widget.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_bottom_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_drawer.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final int? userId;

  const ProfilePage({super.key, this.userId});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final profileController = Provider.of<ProfileController>(context);
    Future<UserProfile?> futureUserProfile;

    if (widget.userId != null) {
      futureUserProfile =
          profileController.getUserProfileById(context, widget.userId!);
    } else {
      futureUserProfile = profileController.getCurrentUserProfile(context);
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const DefaultAppBar(),
      bottomNavigationBar: const DefaultBottomAppBar(),
      endDrawer: const DefaultDrawer(),
      body: Stack(
        children: [
          Container(
            color: backgroundColor,
            width: double.infinity,
            height: double.infinity,
          ),
          FutureBuilder<UserProfile?>(
            future: futureUserProfile,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LoadingAnimation(width: 200, height: 200),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (!snapshot.hasData) {
                return Center(child: Text(localizations.noData));
              } else {
                return ListView(
                  children: [
                    if (!profileController.isEditingProfile)
                      UserDetails(
                        userProfile: snapshot.data!.user,
                      ),
                    if (profileController.isEditingProfile)
                      EditProfile(
                        userProfile: snapshot.data!.user,
                      ),
                    if (snapshot.data!.hardware != null)
                      HardwareCard(
                        hardware: snapshot.data!.hardware!,
                      ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
