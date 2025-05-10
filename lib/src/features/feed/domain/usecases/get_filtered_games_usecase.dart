import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';

class GetFilteredGamesUseCase {
  final FeedRepository repository;

  GetFilteredGamesUseCase(this.repository);

  Future<List<Game>> execute(String filter) {
    return repository.getFilteredGames(filter);
  }
}
