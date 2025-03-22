import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/background_image.dart';
import '../../../../shared/presentation/widgets/default_app_bar.dart';
import '../widgets/create_post_form.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: DefaultAppBar(),
      body: Stack(
        children: [
          BackgroundImage(bottomMargin: 50),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Discover",
                  style: TextStyle(fontSize: 42),
                  textAlign: TextAlign.center,
                ),
              ),

              CreatePostForm(),
            ],
          ),
        ],
      ),
    );
  }
}
