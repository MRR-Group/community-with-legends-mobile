import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_asset_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/presentation/controllers/update_controller.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/background_image.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatelessWidget {
  final VersionAsset? versionAsset;

  const UpdatePage({super.key, required this.versionAsset});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UpdateController>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const AuthAppBar(),
      body: Stack(
        children: [
          const BackgroundImage(bottomMargin: 0),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: secondaryGradient,
              ),
              child: Card(
                child: SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 24,
                        children: [
                          const Text(
                            'Update available',
                            style: TextStyle(
                              fontSize: 42,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '[+] new page \n',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 16,
                            children: [
                              Button(
                                text: "Update",
                                onPressed: () {},
                              ),
                              Button(text: "Next time", onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
