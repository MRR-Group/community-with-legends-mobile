import 'dart:async';
import 'dart:io';

import 'package:community_with_legends_mobile/src/features/post_details/domain/usecases/create_comment_usecase.dart';
import 'package:community_with_legends_mobile/src/features/post_details/domain/usecases/get_post_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostDetailsController extends ChangeNotifier {
  final GetPostUsecase getPost;
  final CreateCommentUsecase createPost;

  Post? get post => _post;
  Post? _post;

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  bool get isCreatingComment => _isCreatingComment;
  bool _isCreatingComment = false;

  GlobalKey<FormState>? formKey;
  String? commentContent;

  PostDetailsController(
    this.getPost,
    this.createPost,
  );

  Future<void> loadPost(BuildContext context, int postId) async {
    _isLoading = true;

    await Future.delayed(Duration.zero);
    notifyListeners();

    try {
      _post = await getPost.execute(postId);
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitComment({
    required BuildContext context,
    required String content,
    int? gameId,
    List<int>? tagIds,
    int? assetId,
    String? assetLink,
  }) async {
    _isCreatingComment = true;

    notifyListeners();

    try {
      final localizations = AppLocalizations.of(context)!;
      await createPost.execute(
        postId: post!.id,
        content: content,
      );

      Alert.of(context).show(text: localizations.posts_commentCreated);
    } catch (e) {
      Alert.of(context).show(text: e.toString());
    } finally {
      _isCreatingComment = false;

      clearForm();
      loadPost(context, post!.id);
    }
  }

  void clearForm() {
    commentContent = null;
    formKey?.currentState?.reset();

    notifyListeners();
  }
}
