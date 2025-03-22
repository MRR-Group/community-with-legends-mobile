import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/feed_menu.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/post_widget.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_bottom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/background_image.dart';
import '../../../../shared/presentation/widgets/default_app_bar.dart';
import '../widgets/create_post_form.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: DefaultAppBar(),
      bottomNavigationBar: DefaultBottomAppBar(),
      body: Stack(
        children: [
          BackgroundImage(bottomMargin: 0),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Discover",
                  style: TextStyle(fontSize: 42),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: FeedMenu(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CreatePostForm(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
