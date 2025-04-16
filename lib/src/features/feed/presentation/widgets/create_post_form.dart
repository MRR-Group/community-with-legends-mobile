import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/asset_types.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/default_dropdown_search_widget.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/toggle_button_form_field.dart';
import 'package:flutter/cupertino.dart';
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
            height: 620,
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
                      controller: widget.contentController,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultDropdownSearch(
                        selectedItem: 'Select game',
                        showSearchBox: true,
                        searchBoxHint: 'Search game...',
                        items: (filter, infiniteScrollProps) async {
                          return [
                            'League of Legends',
                            'R.E.P.O',
                            'Counter Strike 2',
                            'Supermarket Together',
                          ];
                        },
                        onChanged: (value) {
                          print('Wybrano: $value');
                        },
                      ),
                    ),
                    const Text(
                      'Tags',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Button.iconRight(
                          text: 'Clutch moment',
                          fontSize: 12,
                          icon: const Icon(CupertinoIcons.clear_thick,
                              color: textColor),
                          horizontalPadding: 12,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Button.iconRight(
                          text: 'Glitch',
                          fontSize: 12,
                          icon: const Icon(
                            CupertinoIcons.clear_thick,
                            color: textColor,
                          ),
                          horizontalPadding: 12,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultDropdownSearch(
                        overrideSelectedItemTitle: true,
                        selectedItemTitle: 'Add tag',
                        showSearchBox: true,
                        searchBoxHint: 'Search tag...',
                        items: (filter, infiniteScrollProps) async {
                          return [
                            'Clutch moment',
                            'Funny moment',
                            'Glitch',
                          ];
                        },
                        onChanged: (value) {
                          print('Wybrano: $value');
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
                                  content: widget.contentController.text,
                                );
                              } else {
                                print('couldnt validate form');
                              }
                              return;
                            },
                          ),
                          const Spacer(),
                          Button(
                            text: 'Cancel',
                            fontSize: 24,
                            onPressed: () {
                              widget.formKey.currentState?.reset();
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
