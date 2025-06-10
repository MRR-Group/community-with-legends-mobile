import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/data/notifications.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';

class PostNotificationInitializer extends StatefulWidget {
  const PostNotificationInitializer({super.key});

  @override
  State<PostNotificationInitializer> createState() =>
      _PostNotificationInitializerState();
}

class _PostNotificationInitializerState
    extends State<PostNotificationInitializer> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final localizations = AppLocalizations.of(context);

    if (localizations != null) {
      NotificationService().onNewPost = (authorName) {
        final message = localizations.notifications_publishedPost;
        Alert.showGlobal(text: '$authorName $message');
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
