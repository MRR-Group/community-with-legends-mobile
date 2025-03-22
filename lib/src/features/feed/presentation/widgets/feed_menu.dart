
import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';

class FeedMenu extends StatelessWidget {
  const FeedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
              border: Border.all(color: textColor)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: textColor)),
                    color: primaryColor),
                child: Text("Trending"),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: textColor)),
                ),
                child: Text("Recent"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: textColor,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
