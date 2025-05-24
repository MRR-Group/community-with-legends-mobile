import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/games_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/posts_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/tags_controller.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/widgets/selected_tags.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/toggle_button_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePostForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController contentController;
  final TextEditingController gameController;
  final TextEditingController tagController;
  final TextEditingController assetController;

  const CreatePostForm({
    super.key,
    required this.formKey,
    required this.contentController,
    required this.gameController,
    required this.tagController,
    required this.assetController,
  });

  @override
  State<StatefulWidget> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final postController = Provider.of<PostsController>(context);
    final gamesController = Provider.of<GamesController>(context);
    final tagsController = Provider.of<TagsController>(context);
    postController.formKey = widget.formKey;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: secondaryGradient,
        ),
        child: Card(
          child: SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              child: Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.posts_create,
                      style: const TextStyle(fontSize: 32),
                    ),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        hintText: localizations.posts_contentHint,
                        fillColor: backgroundLightColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSaved: (content) {
                        if (content != null) {
                          postController.postContent = content;
                        }
                      },
                      validator: (content) {
                        if (content == null || content.isEmpty) {
                          return localizations.posts_contentRequired;
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultDropdownSearch<Game>(
                        showSearchBox: true,
                        searchBoxHint: localizations.posts_searchGame,
                        listTitle: localizations.posts_addGame,
                        compareFn: (item1, item2) => item1.name == item2.name,
                        filterFn: (_, __) => true,
                        items: (filter, infiniteScrollProps) async {
                          return gamesController.loadFilteredGames(
                            context: context,
                            filter: filter,
                          );
                        },
                        onChanged: (value) {
                          postController.selectedGame = value;
                        },
                        keyToString: (key) {
                          return key?.name ?? '';
                        },
                      ),
                    ),
                    const Text(
                      'Tags',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SelectedTags(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultDropdownSearch<Tag>(
                        overrideSelectedItemTitle: true,
                        listTitle: localizations.posts_addTag,
                        showSearchBox: true,
                        searchBoxHint: localizations.posts_searchTag,
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
                          if (tag != null) {
                            tagsController.addTag(tag);
                          }
                        },
                      ),
                    ),
                    const Text(
                      'Assets',
                      style: TextStyle(fontSize: 24),
                    ),
                    ToggleButtonFormField(
                      initialValue: AssetType.image.displayName,
                      buttons: {
                        'Image': () {
                          setState(() {
                            postController.selectedAssetType = AssetType.image;
                          });
                        },
                        'Video': () {
                          setState(() {
                            postController.selectedAssetType = AssetType.video;
                          });
                        },
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText:
                              '${localizations.posts_linkTo} ${postController.selectedAssetType.displayName}',
                          fillColor: backgroundLightColor,
                          filled: true,
                          suffixIcon: const Icon(Icons.add),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onSaved: (assetLink) {
                          postController.assetLink = assetLink;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Button(
                            text: localizations.posts_post,
                            fontSize: 24,
                            onPressed: _submitForm(postController, tagsController),
                          ),
                          const Spacer(),
                          Button(
                            text: localizations.posts_cancel,
                            fontSize: 24,
                            onPressed: () {
                              widget.formKey.currentState?.reset();
                              postController.clearForm();
                              tagsController.clearTags();
                            },
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
    );
  }

  Function() _submitForm(PostsController postController, TagsController tagsController) {
    return () {
      if (widget.formKey.currentState!.validate()) {
        widget.formKey.currentState!.save();

        postController.submitPost(
          context: context,
          selectedTagIds: tagsController.selectedTagIds,
        );

        tagsController.clearTags();
      }
    };
  }
}
