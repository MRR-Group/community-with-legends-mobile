import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/create_post_form.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/feed_menu.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/posts_view.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/background_image.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      appBar: DefaultAppBar(),
      bottomNavigationBar: DefaultBottomAppBar(),
      body: Stack(
        children: [
          BackgroundImage(bottomMargin: 0),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Discover',
                    style: TextStyle(fontSize: 42),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: FeedMenu(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CreatePostForm(),
                ),
              ),
              PostsView(),
            ],
          ),
        ],
      ),
    );
  }
}
