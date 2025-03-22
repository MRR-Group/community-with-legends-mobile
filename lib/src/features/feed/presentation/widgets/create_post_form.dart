import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/select_button.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';

class CreatePostForm extends StatelessWidget {
  const CreatePostForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: secondaryGradient,
        ),
        child: Card(
          child: SizedBox(
            width: 300,
            height: 610,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create a post",
                        style: TextStyle(fontSize: 32),
                      ),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: "Join the conversation",
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
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            hintText: "Select a game",
                            fillColor: backgroundLightColor,
                            filled: true,
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Tags",
                        style: TextStyle(fontSize: 24),
                      ),
                      Row(
                        children: [
                          Button(
                            text: "Clutch",
                            fontSize: 12,
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Button(
                            text: "Glitch",
                            fontSize: 12,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            hintText: "Add tag",
                            fillColor: backgroundLightColor,
                            filled: true,
                            suffixIcon: Icon(Icons.add),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Assets",
                        style: TextStyle(fontSize: 24),
                      ),
                      Row(
                        children: [
                          SelectButton(
                            text: "Image",
                            fontSize: 16,
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SelectButton(
                            text: "Video",
                            fontSize: 16,
                            onPressed: () {},
                            isSelected: true,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            hintText: "Link to image",
                            fillColor: backgroundLightColor,
                            filled: true,
                            suffixIcon: Icon(Icons.add),
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
                              text: "Post",
                              fontSize: 24,
                              onPressed: () {},
                            ),
                            Spacer(),
                            Button(
                              text: "Cancel",
                              fontSize: 24,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
