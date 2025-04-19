import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
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
  AssetType selectedAssetType = AssetType.image;
  Game? selectedGame;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FeedController>(context);

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
                    const Text(
                      'Create a post',
                      style: TextStyle(fontSize: 32),
                    ),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        hintText: 'Join the conversation',
                        fillColor: backgroundLightColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSaved: (content) {
                        if(content != null){
                          controller.postContent = content;
                        }
                      },
                      validator: (content) {
                        if(content == null || content.isEmpty){
                          return 'Content is required';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultDropdownSearch<Game>(
                        showSearchBox: true,
                        searchBoxHint: 'Search game...',
                        listTitle: 'Add game',
                        compareFn: (item1, item2) => item1.name == item2.name,
                        filterFn: (_, __) => true,
                        items: (filter, infiniteScrollProps) async {
                          return controller.loadFilteredGames(
                            context: context,
                            filter: filter,
                          );
                        },
                        onChanged: (value) {
                          selectedGame = value;
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
                        listTitle: 'Add tag',
                        showSearchBox: true,
                        searchBoxHint: 'Search tag...',
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
                            controller.addTag(tag);
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
                            selectedAssetType = AssetType.image;
                          });
                        },
                        'Video': () {
                          setState(() {
                            selectedAssetType = AssetType.video;
                          });
                        },
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: widget.assetController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Link to ${selectedAssetType.displayName}',
                          fillColor: backgroundLightColor,
                          filled: true,
                          suffixIcon: const Icon(Icons.add),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Button(
                            text: 'Post',
                            fontSize: 24,
                            onPressed: () {
                              if (widget.formKey.currentState!.validate()) {
                                widget.formKey.currentState!.save();
                                controller.submitPost(
                                  context: context,
                                  content: controller.postContent!,
                                  gameId: selectedGame?.id,
                                  assetId: selectedAssetType.id,
                                  assetLink: widget.assetController.text,
                                  tagIds: controller.selectedTags.map((tag) => tag.id).toList(),
                                );
                              }
                            },
                          ),
                          const Spacer(),
                          Button(
                            text: 'Cancel',
                            fontSize: 24,
                            onPressed: () {
                              controller.clearTags();
                              widget.formKey.currentState?.reset();
                              selectedGame = null;
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
}
