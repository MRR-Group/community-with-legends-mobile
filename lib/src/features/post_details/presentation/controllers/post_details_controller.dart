import 'dart:async';
import 'dart:io';

import 'package:community_with_legends_mobile/src/features/post_details/domain/usecases/get_post_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class PostDetailsController extends ChangeNotifier {
  final GetPostUsecase getPost;

  Post? _post;

  Post? get post => _post;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  PostDetailsController(
    this.getPost,
  );

  Future<void> loadPost(BuildContext context, int postId) async {
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      _post = await getPost.execute(postId);
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
