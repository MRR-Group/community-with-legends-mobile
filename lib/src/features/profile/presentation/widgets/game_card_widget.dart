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
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            game.cover,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 100,
          child: Text(
            game.name,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
