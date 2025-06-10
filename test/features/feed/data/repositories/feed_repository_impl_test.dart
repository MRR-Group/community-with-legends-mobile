import 'package:community_with_legends_mobile/src/features/feed/data/data_sources/feed_data_source.dart';
import 'package:community_with_legends_mobile/src/features/feed/data/repositories/feed_repository_impl.dart';
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
}
