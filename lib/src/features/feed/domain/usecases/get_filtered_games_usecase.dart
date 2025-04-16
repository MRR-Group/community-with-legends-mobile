import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';

class GetFilteredGamesUseCase {
  final FeedRepository repository;

  GetFilteredGamesUseCase(this.repository);

  Future<List<String>> execute(String filter) {
    return repository.getFilteredGames(filter);
  }
}
