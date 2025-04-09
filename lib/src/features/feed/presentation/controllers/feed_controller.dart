import 'package:community_with_legends_mobile/src/core/errors/exceptions/unauthenticated_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/feed_posts_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_posts_usecase.dart';
import 'package:flutter/material.dart';

class FeedController extends ChangeNotifier{
  final GetPostsUseCase getPosts;

  FeedController(this.getPosts);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FeedPosts? _feedPosts;
  FeedPosts? get feedPosts => _feedPosts;

  String?  _error;
  String? get error => _error;

  Future<void> loadPosts(BuildContext context) async {
    _isLoading = true;
    await Future.delayed(Duration.zero);
    notifyListeners();

    try{
      _feedPosts = await getPosts.execute();
    }catch(e){
      if(e is UnauthenticatedException){
        Navigator.pushReplacementNamed(context, '/login');
      }
      _error = e.toString();
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}
