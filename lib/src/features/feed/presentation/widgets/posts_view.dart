import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/post_widget.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
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
    final feedController = Provider.of<FeedController>(context, listen: false);
    feedController.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    final feedController = Provider.of<FeedController>(context);

    if (feedController.isLoading) {
      return const SliverToBoxAdapter(child: LoadingAnimation(width: 200, height: 200));
    }

    if (feedController.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Alert.of(context).show(text: feedController.error!);
      });
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    final posts = feedController.feedPosts?.posts ?? [];

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
