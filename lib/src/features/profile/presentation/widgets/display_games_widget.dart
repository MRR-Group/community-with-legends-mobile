import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:flutter/cupertino.dart';

class DisplayGames extends StatelessWidget{
  final List<UserGame> userGames;

  const DisplayGames({super.key, required this.userGames});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.7,
      children: userGames.map((userGame) {
        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  userGame.game.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                userGame.game.name,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
