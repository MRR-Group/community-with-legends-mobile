import 'package:flutter/material.dart';

class InvalidPostAsset extends StatelessWidget {
  const InvalidPostAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 64,
          color: Colors.grey,
        ),
      ),
    );
  }
}
