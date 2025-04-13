import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostWidget extends StatelessWidget {
  const PostWidget({super.key,required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
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
                                post.user.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                post.game?.name ?? '',
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                timeago.format(post.createdAt),
                                style: const TextStyle(
                                  color: textDisabledColor,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(post.content),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Button(
                              text: '👍 x 0',
                              fontSize: 10,
                              onPressed: () {},
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
          child: Button(
            text: 'Reply',
            fontSize: 10,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
