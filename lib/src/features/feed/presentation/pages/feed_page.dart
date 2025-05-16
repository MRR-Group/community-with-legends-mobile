import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/create_post_form.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/feed_menu.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/posts_view.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/background_image.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_bottom_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_drawer.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController gameController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController assetController = TextEditingController();

  FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const DefaultAppBar(),
      bottomNavigationBar: const DefaultBottomAppBar(),
      endDrawer: const DefaultDrawer(),
      body: Stack(
        children: [
          const BackgroundImage(bottomMargin: 0),
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Discover',
                    style: TextStyle(fontSize: 42),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: FeedMenu(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CreatePostForm(
                    formKey: formKey,
                    contentController: contentController,
                    assetController: assetController,
                    gameController: gameController,
                    tagController: tagController,
                  ),
                ),
              ),
              const PostsView(),
            ],
          ),
        ],
      ),
    );
  }
}
