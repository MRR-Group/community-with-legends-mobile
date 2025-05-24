import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/cupertino.dart';

class PostTags extends StatefulWidget {
  final List<Tag> tags;

  const PostTags({super.key, required this.tags});

  @override
  State<StatefulWidget> createState() {
    return _PostTagsState();
  }
}

class _PostTagsState extends State<PostTags> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.tags.map((tag) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Button(
              text: tag.name,
              fontSize: 12,
              horizontalPadding: 12,
              onPressed: () {},
            ),
          );
        }).toList(),
      ),
    );
  }
}
