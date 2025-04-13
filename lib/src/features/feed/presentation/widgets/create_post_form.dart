import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/features/feed/presentation/controllers/feed_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/select_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePostForm extends StatelessWidget {
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
            height: 610,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create a post',
                      style: TextStyle(fontSize: 32),
                    ),
                    TextFormField(
                      controller: contentController,
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
                      child: TextFormField(
                        controller: gameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Select a game',
                          fillColor: backgroundLightColor,
                          filled: true,
                          suffixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Tags',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Button(
                          text: 'Clutch',
                          fontSize: 12,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Button(
                          text: 'Glitch',
                          fontSize: 12,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: tagController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Add tag',
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
                    const Text(
                      'Assets',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        SelectButton(
                          text: 'Image',
                          fontSize: 16,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SelectButton(
                          text: 'Video',
                          fontSize: 16,
                          onPressed: () {},
                          isSelected: true,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: assetController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Link to image',
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
                              controller.submitPost(
                                context: context,
                                content: contentController.text,
                              );
                            },
                          ),
                          const Spacer(),
                          Button(
                            text: 'Cancel',
                            fontSize: 24,
                            onPressed: () {
                              formKey.currentState?.reset();
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
