import 'package:community_with_legends_mobile/src/features/feed/data/data_sources/feed_api.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/repositories/feed_repository.dart';
import 'package:flutter/cupertino.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedApi api;

  FeedRepositoryImpl(this.api);

  @override
  Future<FeedPosts> getPosts() async {
      final response = await api.getPosts();

      try {
        final result = FeedPosts.fromJson(response);
        return result;
      } catch (e) {
        rethrow;
      }

  }
}
