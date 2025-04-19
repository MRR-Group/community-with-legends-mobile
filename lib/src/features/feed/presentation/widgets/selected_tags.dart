import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SelectedTags extends StatefulWidget {
  const SelectedTags({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectedTagsState();
  }
}

class _SelectedTagsState extends State<SelectedTags> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FeedController>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.selectedTags.map((tag) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Button.iconRight(
              text: tag.name,
              fontSize: 12,
              icon: const Icon(
                CupertinoIcons.clear_thick,
                color: textColor,
              ),
              horizontalPadding: 12,
              onPressed: () {
                controller.removeTag(tag);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
