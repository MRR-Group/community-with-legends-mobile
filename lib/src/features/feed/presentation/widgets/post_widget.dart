import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: secondaryGradient,
            ),
            child: Card(
              child: SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/loading.gif",
                            height: 52,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Zoro",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Swordsman VR",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "3 days ago",
                                style: TextStyle(
                                  color: textDisabledColor,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "I don't know. I'm not sure why myself. But if I were to take even one  step back, I believe that all those important oaths, promises and many  other deals 'til now, will all go to waste and I'll never be able to  return before you, ever again.",
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Button(
                              text: "x 10",
                              fontSize: 10,
                              onPressed: () {},
                            ),
                            SizedBox(width: 20,),
                            Button(
                              text: "Add reactions",
                              fontSize: 10,
                              onPressed: () {},
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
        Positioned(
          right: 75,
          bottom: 0,
          child: Button(
            text: "Reply",
            fontSize: 10,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
