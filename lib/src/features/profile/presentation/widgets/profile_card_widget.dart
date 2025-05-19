import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget{
  final Widget child;
  const ProfileCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: secondaryGradient,
      ),
      child: Card(
        color: backgroundLightColor,
        child: child
      ),
    );
  }
}