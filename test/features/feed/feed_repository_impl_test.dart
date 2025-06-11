import 'package:community_with_legends_mobile/src/features/feed/data/data_sources/feed_data_source.dart';
import 'package:community_with_legends_mobile/src/features/feed/data/repositories/feed_repository_impl.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([FeedDataSource])
import 'feed_repository_impl_test.mocks.dart';

void main() {
  late FeedRepositoryImpl repository;
  late MockFeedDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockFeedDataSource();
    repository = FeedRepositoryImpl(mockDataSource);
  });

  final fakeJsonResponse = {
    'data': [
      {
        'id': 1,
        'content': 'Hello',
        'created_at': '2025-06-10T12:00:00.000Z',
        'user': {
          'id': 1,
          'name': 'user1',
          'email': 'user1@cwl.com',
          'avatar': '',
          'isBanned': false,
          'hasPassword': true,
          'hasTwitchAccount': false,
          'email_verified_at': '2025-06-09T10:00:00.000Z',
          'created_at': '2025-05-01T09:00:00.000Z',
        },
        'reactions': 5,
        'user_reacted': false,
      },
      {
        'id': 2,
        'content': 'World',
        'created_at': '2025-06-10T12:05:00.000Z',
        'user': {
          'id': 2,
          'name': 'user2',
          'email': 'user2@cwl.com',
          'avatar': '',
          'isBanned': false,
          'hasPassword': true,
          'hasTwitchAccount': false,
          'email_verified_at': '2025-06-01T08:00:00.000Z',
          'created_at': '2025-05-02T07:00:00.000Z',
        },
        'reactions': 3,
        'user_reacted': true,
      },
    ],
    'links': {
      'first': 'https://cwl.legnica.pl/api/posts?page=1',
      'last': 'https://cwl.legnica.pl/api/posts?page=8',
      'prev': null,
      'next': 'https://cwl.legnica.pl/api/posts?page=2',
    },
    'meta': {
      'current_page': 1,
      'from': 1,
      'last_page': 8,
      'links': [
        {'url': null, 'label': '« Previous', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=1', 'label': '1', 'active': true},
        {'url': 'https://cwl.legnica.pl/api/posts?page=2', 'label': '2', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=3', 'label': '3', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=4', 'label': '4', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=5', 'label': '5', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=6', 'label': '6', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=7', 'label': '7', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=8', 'label': '8', 'active': false},
        {'url': 'https://cwl.legnica.pl/api/posts?page=2', 'label': 'Next »', 'active': false},
      ],
      'path': 'https://cwl.legnica.pl/api/posts',
      'per_page': 10,
      'to': 10,
      'total': 78,
    },
  };


  final testPosts = (fakeJsonResponse['data']! as List)
      .map((json) => Post.fromJson(json))
      .toList();


  test('FeedRepository returns List<Post> parsed from JSON map', () async {
    when(mockDataSource.getPosts(1)).thenAnswer((_) async => fakeJsonResponse);

    final feedPosts = await repository.getPosts(1);
    final posts = feedPosts.posts;

    expect(posts, isA<List<Post>>());
    expect(posts.length, testPosts.length);
    expect(posts[0].content, testPosts[0].content);
    verify(mockDataSource.getPosts(1)).called(1);
  });

  test('should throw when datasource throws', () async {
    when(mockDataSource.getPosts(1)).thenThrow(Exception('Data error'));

    expect(() => repository.getPosts(1), throwsException);
  });

  test('FeedRepository returns trending posts from JSON map', () async {
    when(mockDataSource.getTrendingPosts()).thenAnswer((_) async => fakeJsonResponse);

    final feedPosts = await repository.getTrendingPosts();
    final posts = feedPosts.posts;

    expect(posts, isA<List<Post>>());
    expect(posts.length, testPosts.length);
    expect(posts[1].content, testPosts[1].content);
    verify(mockDataSource.getTrendingPosts()).called(1);
  });

  test('getTrendingPosts should throw when data source throws', () async {
    when(mockDataSource.getTrendingPosts()).thenThrow(Exception('Error'));

    expect(() => repository.getTrendingPosts(), throwsException);
  });

  test('FeedRepository returns filtered posts from JSON map', () async {
    when(mockDataSource.getFilteredPosts(1, 2)).thenAnswer((_) async => fakeJsonResponse);

    final feedPosts = await repository.getFilteredPosts(1, 2);

    expect(feedPosts.posts.length, testPosts.length);
    verify(mockDataSource.getFilteredPosts(1, 2)).called(1);
  });

  test('getFilteredPosts should throw when data source throws', () async {
    when(mockDataSource.getFilteredPosts(1, 2)).thenThrow(Exception('Error'));

    expect(() => repository.getFilteredPosts(1, 2), throwsException);
  });
  final fakeGamesJson = {
    'data': [
      {'id': 1, 'name': 'Game 1', 'cover': 'linktToImage'},
      {'id': 2, 'name': 'Game 2', 'cover': 'linktToImage2'},
    ],
  };

  test('FeedRepository returns list of filtered games', () async {
    when(mockDataSource.getFilteredGames('test')).thenAnswer((_) async => fakeGamesJson);

    final games = await repository.getFilteredGames('test');

    expect(games, isA<List<Game>>());
    expect(games.length, 2);
    expect(games[0].name, 'Game 1');
    verify(mockDataSource.getFilteredGames('test')).called(1);
  });

  test('getFilteredGames should throw when data source throws', () async {
    when(mockDataSource.getFilteredGames('test')).thenThrow(Exception('Error'));

    expect(() => repository.getFilteredGames('test'), throwsException);
  });
  final fakeTagsJson = {
    'data': [
      {'id': 1, 'name': 'Tag1'},
      {'id': 2, 'name': 'Tag2'},
    ],
  };

  test('FeedRepository returns list of tags', () async {
    when(mockDataSource.getTags('test')).thenAnswer((_) async => fakeTagsJson);

    final tags = await repository.getTags('test');

    expect(tags, isA<List<Tag>>());
    expect(tags.length, 2);
    expect(tags[1].name, 'Tag2');
    verify(mockDataSource.getTags('test')).called(1);
  });

  test('getTags should throw when data source throws', () async {
    when(mockDataSource.getTags('test')).thenThrow(Exception('Error'));

    expect(() => repository.getTags('test'), throwsException);
  });
  test('createPost should call dataSource with correct arguments', () async {
    when(mockDataSource.createPost(
      content: 'Hello',
      gameId: 1,
      tagIds: [1, 2],
      assetId: 3,
      assetLink: 'link',
    ),).thenAnswer((_) async => {});

    await repository.createPost(
      content: 'Hello',
      gameId: 1,
      tagIds: [1, 2],
      assetId: 3,
      assetLink: 'link',
    );

    verify(mockDataSource.createPost(
      content: 'Hello',
      gameId: 1,
      tagIds: [1, 2],
      assetId: 3,
      assetLink: 'link',
    ),).called(1);
  });
  test('addReactionToPost calls dataSource method', () async {
    when(mockDataSource.addPostReaction(1)).thenAnswer((_) async => {});
    await repository.addReactionToPost(1);
    verify(mockDataSource.addPostReaction(1)).called(1);
  });

  test('removeReactionFromPost calls dataSource method', () async {
    when(mockDataSource.removePostReaction(2)).thenAnswer((_) async => {});
    await repository.removeReactionFromPost(2);
    verify(mockDataSource.removePostReaction(2)).called(1);
  });

  test('reportPost calls dataSource method', () async {
    when(mockDataSource.reportPost(3)).thenAnswer((_) async => {});
    await repository.reportPost(3);
    verify(mockDataSource.reportPost(3)).called(1);
  });

  test('deletePost calls dataSource method', () async {
    when(mockDataSource.deletePost(4)).thenAnswer((_) async => {});
    await repository.deletePost(4);
    verify(mockDataSource.deletePost(4)).called(1);
  });

}
