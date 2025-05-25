import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/posts_controller.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_popup_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostMenuButton extends StatelessWidget {
  final Post post;

  const PostMenuButton({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final postsController = Provider.of<PostsController>(context);

    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
        color: textDisabledColor,
      ),
      onSelected: (value) => postsController.handlePopupMenu(context, value, post),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        DefaultPopupMenuItem.build(
          value: 'report',
          label: localizations.report_post,
          icon: Icons.flag_outlined,
        ),
        DefaultPopupMenuItem.build(
          value: 'delete',
          label: localizations.delete_post,
          icon: Icons.delete_outline,
        ),
      ],
    );
  }
}
