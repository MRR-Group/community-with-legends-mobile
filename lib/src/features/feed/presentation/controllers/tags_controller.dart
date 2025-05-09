import 'dart:async';

import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/models/tag_model.dart';
import 'package:community_with_legends_mobile/src/features/feed/domain/usecases/get_tags_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class TagsController extends ChangeNotifier {
  List<Tag> selectedTags = [];
  List<int> get selectedTagIds => selectedTags.map((tag) => tag.id).toList();

  GetTagsUseCase getTags;

  TagsController(this.getTags);

  void addTag(Tag newTag) {
    final alreadySelected = selectedTags.any((tag) => tag.id == newTag.id);

    if (!alreadySelected) {
      selectedTags.add(newTag);
      notifyListeners();
    }
  }

  void removeTag(Tag tag) {
    selectedTags.remove(tag);
    notifyListeners();
  }

  FutureOr<List<Tag>> loadTags({
    required BuildContext context,
    required String filter,
  }) async {

    try {
      return await getTags.execute(filter);
    } on HttpException catch (e) {
      Navigator.pushReplacementNamed(context, '/login');
      Alert.of(context).show(text: e.toString());
      return [];
    }
  }
}
