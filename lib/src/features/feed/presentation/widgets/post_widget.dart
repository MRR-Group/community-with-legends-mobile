import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/post_tags.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostWidget extends StatefulWidget{
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  State<StatefulWidget> createState() {
    return _PostWidgetState();
  }

}

class _PostWidgetState extends State<PostWidget> {

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FeedController>(context);

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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.post.user.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
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
                        ],
                      ),
                      if (widget.post.tags != null && widget.post.tags!.isNotEmpty)
                        PostTags(tags: widget.post.tags!),
                      Text(widget.post.content),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Button(
                              text: '👍 x ${widget.post.reactionsCount}',
                              fontSize: 10,
                              onPressed: () async {
                                await controller.addReaction(context, widget.post);
                              },
                              horizontalPadding: 8,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Button(
                              text: 'Add reactions',
                              fontSize: 10,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 75,
          bottom: 0,
          child: Button.iconLeft(
            icon: const Icon(
              CupertinoIcons.chat_bubble_text_fill,
              color: textColor,
            ),
            horizontalPadding: 12,
            text: 'Reply',
            fontSize: 16,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
