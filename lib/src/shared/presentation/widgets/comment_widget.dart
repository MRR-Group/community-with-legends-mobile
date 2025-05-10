import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentWidget extends StatefulWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  State<StatefulWidget> createState() {
    return _PostWidgetState();
  }
}

class _PostWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: primaryGradient,
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
                                  widget.comment.user.name,
                                  style: const TextStyle(fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  timeago.format(widget.comment.createdAt),
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
                      Text(widget.comment.content),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
