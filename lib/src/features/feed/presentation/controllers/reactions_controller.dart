import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/add_reaction_usecase.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/remove_reaction_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/post_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class ReactionsController extends ChangeNotifier {
  AddReactionToPostUsecase addReactionToPost;
  RemoveReactionFromPostUsecase removeReactionFromPost;

  ReactionsController({
    required this.addReactionToPost,
    required this.removeReactionFromPost,
  });

  Future<void> addReaction(BuildContext context, Post post) async {
    try {
      await addReactionToPost.execute(post.id);

      post.reactionsCount++;
      post.userReacted = true;
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeReaction(BuildContext context, Post post) async {
    try {
      await removeReactionFromPost.execute(post.id);

      post.reactionsCount--;
      post.userReacted = false;
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());
    } finally {
      notifyListeners();
    }
  }
}
