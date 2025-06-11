import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/posts_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/post_widget.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<StatefulWidget> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  late final PagingController<int, Post> _pagingController;

  @override
  void initState() {
    super.initState();

    final postsController =
        Provider.of<PostsController>(context, listen: false);

    _pagingController = PagingController<int, Post>(
      getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
      fetchPage: (pageKey) => postsController.getPosts(pageKey),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) {
        return;
      }

      final returnMessage = await postsController.loadPosts(context);

      Alert.of(context).show(text: returnMessage);
    });

    postsController.addListener(() {
      if (mounted) {
        _pagingController.refresh();
      }
    });
  }

  @override
  void dispose() {
    final postsController =
        Provider.of<PostsController>(context, listen: false);

    _pagingController.dispose();
    postsController.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postsController = Provider.of<PostsController>(context);

    if (postsController.isLoading) {
      return const SliverToBoxAdapter(
        child: LoadingAnimation(width: 200, height: 200),
      );
    }

    return PagingListener(
      controller: _pagingController,
      builder: (context, state, fetchNextPage) {
        if (state.error != null) {
          return SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Something went wrong',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const LoadingAnimation(width: 100, height: 100),
                  Button(
                    text: 'Try again',
                    onPressed: _pagingController.refresh,
                  ),
                ],
              ),
            ),
          );
        }

        return PagedSliverList<int, Post>(
          state: state,
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) => PostWidget(post: item),
          ),
        );
      },
    );
  }
}
