import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/post_widget.dart';
import 'package:community_with_legends_mobile/src/features/post_details/presentation/controllers/post_details_controller.dart';
import 'package:community_with_legends_mobile/src/features/post_details/presentation/widgets/create_comment_form.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/background_image.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/comment_widget.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_bottom_app_bar.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_drawer.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDetailsPage extends StatefulWidget {
  final int postId;

  const PostDetailsPage({super.key, required this.postId});

  @override
  State<StatefulWidget> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final postDetailsController =
        Provider.of<PostDetailsController>(context, listen: false);

    postDetailsController.loadPost(context, widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    final postDetailsController = Provider.of<PostDetailsController>(context);

    if (postDetailsController.isLoading) {
      return const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: DefaultAppBar(),
        bottomNavigationBar: DefaultBottomAppBar(),
        endDrawer: DefaultDrawer(),
        body: Stack(
          children: [
            BackgroundImage(bottomMargin: 0),
            Center(
              child: LoadingAnimation(width: 200, height: 200),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const DefaultAppBar(),
      bottomNavigationBar: const DefaultBottomAppBar(),
      body: Stack(
        children: [
          const BackgroundImage(bottomMargin: 0),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 8),
                  child: PostWidget(
                    post: postDetailsController.post!,
                    disableReplyButton: true,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CreateCommentForm(
                    formKey: formKey,
                    contentController: contentController,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final comment =
                        postDetailsController.post!.comments?[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CommentWidget(comment: comment!),
                    );
                  },
                  childCount: postDetailsController.post!.comments?.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
