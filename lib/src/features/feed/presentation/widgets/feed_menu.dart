
import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class FeedMenu extends StatelessWidget {
  const FeedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
              border: Border.all(color: textColor),),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: textColor)),
                    color: primaryColor,),
                child: const Text('Trending'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: textColor)),
                ),
                child: const Text('Recent'),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: textColor,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
