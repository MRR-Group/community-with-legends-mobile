import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/usecases/search_users_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';

class UserSearchController extends ChangeNotifier{
  SearchUsersUsecase searchUsersUsecase;

  UserSearchController(this.searchUsersUsecase);

  Future<List<User>> searchUsersByName({required BuildContext context, required String filter}) async {
    try{
      return searchUsersUsecase.execute(filter);
    } on HttpException catch (e) {
      Alert.of(context).show(text: e.toString());

      return [];
    }
  }

}
