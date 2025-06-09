import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              game.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            game.name,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
