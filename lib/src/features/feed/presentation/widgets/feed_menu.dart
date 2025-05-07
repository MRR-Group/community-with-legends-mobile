import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedMenu extends StatefulWidget{
  const FeedMenu({super.key});

  @override
  State<StatefulWidget> createState() => _FeedMenuState();
}

class _FeedMenuState extends State<FeedMenu> {

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FeedController>(context);

    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
                /*borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),*/
                border: Border.all(color: textColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: textColor)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        bottomLeft: Radius.circular(2),
                      ),
                    ),
                    child: const Text('Trending'),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: textColor)),
                      color: primaryColor,
                    ),
                    child: const Text('Recent'),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: textColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 200,
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
                        listTitle: 'Tag',
                        showSearchBox: true,
                        searchBoxHint: 'Add tag',
                        compareFn: (item1, item2) => item1.id == item2.id,
                        filterFn: (_, __) => true,
                        keyToString: (key) => key?.name ?? '',
                        items: (filter, infiniteScrollProps) async {
                          final tags = await controller.loadTags(
                            context: context,
                            filter: filter,
                          );
                          return tags;
                        },
                        onChanged: (tag) {
                          if (tag != null) {
                          }
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
                        searchBoxHint: 'Search game...',
                        listTitle: 'Game',
                        compareFn: (item1, item2) => item1.name == item2.name,
                        filterFn: (_, __) => true,
                        items: (filter, infiniteScrollProps) async {
                          return controller.loadFilteredGames(
                            context: context,
                            filter: filter,
                          );
                        },
                        onChanged: (value) {
                        },
                        keyToString: (key) {
                          return key?.name ?? '';
                        },
                      ),
                    ),
                  ),
                  Button(
                    text: 'Search',
                    fontSize: 16,
                    onPressed: (){},
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
