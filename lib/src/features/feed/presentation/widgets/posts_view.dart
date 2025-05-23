import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/posts_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/post_widget.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<StatefulWidget> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) {
        return;
      }

      final postsController =
          Provider.of<PostsController>(context, listen: false);

      await postsController.loadPosts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final postsController = Provider.of<PostsController>(context);

    if (postsController.isLoading) {
      return const SliverToBoxAdapter(
        child: LoadingAnimation(width: 200, height: 200),
      );
    }

    final posts = postsController.feedPosts?.posts ?? [];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final post = posts[index];
          return PostWidget(post: post);
        },
        childCount: posts.length,
      ),
    );
  }
}
