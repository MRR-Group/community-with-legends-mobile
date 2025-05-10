import 'package:community_with_legends_mobile/src/features/feed/domain/models/post_tab.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/posts_controller.dart';
import 'package:flutter/cupertino.dart';

class PostTabController extends ChangeNotifier{
  PostTab get selectedPostTab => _selectedPostTab;
  PostTab _selectedPostTab = PostTab.recent;

  PostsController postsController;

  PostTabController(this.postsController);

  void selectPostTab(BuildContext context, PostTab postTab) {
    switch (postTab) {
      case PostTab.trending:
        _selectedPostTab = PostTab.trending;
        postsController.loadTrendingPosts(context);
        break;
      case PostTab.recent:
        _selectedPostTab = PostTab.recent;
        postsController.loadPosts(context);
        break;
      case PostTab.filtered:
        _selectedPostTab = PostTab.filtered;
        break;
    }
  }
}
