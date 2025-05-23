import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/reactions_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/post_tags.dart';
import 'package:community_with_legends_mobile/src/features/post_details/presentation/pages/post_details_page.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;


class PostWidget extends StatefulWidget {
  final Post post;
  final bool disableReplyButton;

  const PostWidget({
    super.key,
    required this.post,
    this.disableReplyButton = false,
  });

  @override
  State<StatefulWidget> createState() {
    return _PostWidgetState();
  }
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final reactionsController = Provider.of<ReactionsController>(context);

    return Stack(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: secondaryGradient,
            ),
            child: Card(
              child: SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/loading.gif',
                            height: 52,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.post.user.name,
                                  style: const TextStyle(fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                if (widget.post.game != null)
                                  Text(
                                    widget.post.game!.name,
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                Text(
                                  timeago.format(widget.post.createdAt),
                                  style: const TextStyle(
                                    color: textDisabledColor,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (widget.post.tags != null &&
                          widget.post.tags!.isNotEmpty)
                        PostTags(tags: widget.post.tags!),
                      Text(widget.post.content),
                      Row(
                        children: [
                          Button(
                            text: '👍 x ${widget.post.reactionsCount}',
                            fontSize: 10,
                            gradient: widget.post.userReacted
                                ? secondaryGradient
                                : primaryGradient,
                            onPressed: () async {
                              if (widget.post.userReacted) {
                                reactionsController.removeReaction(context, widget.post);
                              } else {
                                reactionsController.addReaction(context, widget.post);
                              }
                            },
                            horizontalPadding: 8,
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
        if (!widget.disableReplyButton)
          Positioned(
            right: 75,
            bottom: 0,
            child: Button.iconLeft(
              icon: const Icon(
                CupertinoIcons.chat_bubble_text_fill,
                color: textColor,
              ),
              horizontalPadding: 12,
              text: localizations.posts_reply,
              fontSize: 16,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PostDetailsPage(postId: widget.post.id),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
