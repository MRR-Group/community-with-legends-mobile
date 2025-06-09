import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/presentation/widgets/game_card_widget.dart';
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
        return GameCard(game: userGame.game);
      }).toList(),
    );
  }
}
