import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_info_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_response_model.dart';
import 'package:community_with_legends_mobile/src/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/background_image.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatelessWidget {
  final VersionInfo? versionInfo;

  const UpdatePage({super.key, required this.versionInfo});

  @override
  Widget build(BuildContext context) {
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
                          Text(
                            versionInfo?.name ?? '',
                            style: const TextStyle(
                              fontSize: 26,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              versionInfo?.description ?? '',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 16,
                            children: [
                              Button(
                                text: "Update",
                                onPressed: () {
                                  launchUrl(
                                    Uri.parse(
                                      versionInfo?.downloadUrl ?? '',
                                    ),
                                  );
                                },
                              ),
                              Button(
                                text: 'Next time',
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/feed',
                                  );
                                },
                              ),
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
