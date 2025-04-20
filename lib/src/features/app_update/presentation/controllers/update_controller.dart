import 'package:community_with_legends_mobile/src/features/app_update/domain/usecases/check_update_usecase.dart';
import 'package:flutter/cupertino.dart';

class UpdateController extends ChangeNotifier{
  final CheckUpdateUsecase checkUpdateUsecase;

  UpdateController(this.checkUpdateUsecase);

  void checkForUpdate(){
    checkUpdateUsecase.execute();
  }
}