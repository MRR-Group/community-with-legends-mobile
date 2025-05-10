import 'dart:async';

import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_filtered_games_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';

class GamesController extends ChangeNotifier{
  final GetFilteredGamesUseCase getFilteredGames;

  GamesController(this.getFilteredGames);

  FutureOr<List<Game>> loadFilteredGames({
    required BuildContext context,
    required String filter,
  }) async {

    try {
      return await getFilteredGames.execute(filter);
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());

      return [];
    }
  }
}
