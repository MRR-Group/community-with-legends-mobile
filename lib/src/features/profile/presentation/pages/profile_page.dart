import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/controllers/profile_controller.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/user_details_widget.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_bottom_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
    final profileController = Provider.of<ProfileController>(context);
    final futureUserProfile = profileController.getUserProfile(context, 1);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const DefaultAppBar(),
      bottomNavigationBar: const DefaultBottomAppBar(),
      body: Stack(
        children: [
          Container(
            color: backgroundColor,
            width: double.infinity,
            height: double.infinity,
          ),
          FutureBuilder<User?>(
            future: futureUserProfile,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LoadingAnimation(width: 200, height: 200),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Brak danych'));
              } else {
                return UserDetails(userProfile: snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }
}
