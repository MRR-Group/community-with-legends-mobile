import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/post_tab.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/games_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/post_tab_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/posts_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/tags_controller.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FeedMenu extends StatefulWidget {
  const FeedMenu({super.key});

  @override
  State<StatefulWidget> createState() => _FeedMenuState();
}

class _FeedMenuState extends State<FeedMenu> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final postsController = Provider.of<PostsController>(context);
    final postTabController = Provider.of<PostTabController>(context);
    final tagsController = Provider.of<TagsController>(context);
    final gamesController = Provider.of<GamesController>(context);

    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            Container(
              width: 225,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                border: Border.all(color: textColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        postTabController.selectPostTab(context, PostTab.trending);
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border:
                            const Border(right: BorderSide(color: textColor)),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(2),
                        ),
                        color: postTabController.selectedPostTab == PostTab.trending
                            ? primaryColor
                            : backgroundColor,
                      ),
                      child: Text(localizations.posts_trending),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        postTabController.selectPostTab(context, PostTab.recent);
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border:
                            const Border(right: BorderSide(color: textColor)),
                        color: postTabController.selectedPostTab == PostTab.recent
                            ? primaryColor
                            : backgroundColor,
                      ),
                      child: Text(localizations.posts_recent),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          postTabController.selectPostTab(context, PostTab.filtered);
                        });
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(2),
                          ),
                          color: postTabController.selectedPostTab == PostTab.filtered
                              ? primaryColor
                              : backgroundColor,
                        ),
                        child: const Icon(
                          Icons.filter_alt_outlined,
                          color: textColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (postTabController.selectedPostTab == PostTab.filtered)
              Container(
                padding: const EdgeInsets.all(8),
                width: 225,
                decoration: const BoxDecoration(
                  color: backgroundColor,
                  border: Border(
                    right: BorderSide(color: textColor),
                    left: BorderSide(color: textColor),
                    bottom: BorderSide(color: textColor),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: DefaultDropdownSearch<Tag>(
                          listTitle: localizations.posts_tag,
                          showSearchBox: true,
                          searchBoxHint: localizations.posts_addTag,
                          compareFn: (item1, item2) => item1.id == item2.id,
                          filterFn: (_, __) => true,
                          keyToString: (key) => key?.name ?? '',
                          items: (filter, infiniteScrollProps) async {
                            final tags = await tagsController.loadTags(
                              context: context,
                              filter: filter,
                            );
                            return tags;
                          },
                          onChanged: (tag) {
                            postsController.tagFilter = tag;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: DefaultDropdownSearch<Game>(
                          showSearchBox: true,
                          searchBoxHint: localizations.posts_searchGame,
                          listTitle: localizations.posts_game,
                          compareFn: (item1, item2) => item1.name == item2.name,
                          filterFn: (_, __) => true,
                          items: (filter, infiniteScrollProps) async {
                            return gamesController.loadFilteredGames(
                              context: context,
                              filter: filter,
                            );
                          },
                          onChanged: (game) {
                            postsController.gameFilter = game;
                          },
                          keyToString: (key) {
                            return key?.name ?? '';
                          },
                        ),
                      ),
                    ),
                    Button(
                      text: localizations.posts_search,
                      fontSize: 16,
                      onPressed: () {
                        postsController.loadFilteredPosts(context);
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
