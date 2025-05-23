import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/post_details/presentation/controllers/post_details_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateCommentForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController contentController;

  const CreateCommentForm({
    super.key,
    required this.formKey,
    required this.contentController,
  });

  @override
  State<StatefulWidget> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreateCommentForm> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final controller = Provider.of<PostDetailsController>(context);
    controller.formKey = widget.formKey;

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
                      localizations.posts_comment,
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
                          controller.commentContent = content;
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
                      child: Row(
                        children: [
                          Button(
                            text: localizations.posts_post,
                            fontSize: 24,
                            onPressed: _submitForm(controller),
                          ),
                          const Spacer(),
                          Button(
                            text: localizations.posts_cancel,
                            fontSize: 24,
                            onPressed: () {
                              widget.formKey.currentState?.reset();
                              controller.clearForm();
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

  Function() _submitForm(PostDetailsController controller) {
    return () {
      if (widget.formKey.currentState!.validate()) {
        widget.formKey.currentState!.save();
        controller.submitComment(
          context: context,
          content: controller.commentContent!,
        );
      }
    };
  }
}
