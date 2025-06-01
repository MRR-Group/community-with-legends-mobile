import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

class UserProfile {
  final User user;
  final List<Hardware>? hardware;

  UserProfile({
    required this.user,
    this.hardware,
  });

}
