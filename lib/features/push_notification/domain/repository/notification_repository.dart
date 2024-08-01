import 'package:flutter_push_notification/features/push_notification/data/data_source/notification_data_source.dart';
import 'package:flutter_push_notification/features/push_notification/data/repository/notification_repo_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository.g.dart';

@riverpod
NotificationRepo notificationRepo(Ref ref) {
  return NotificationRepoImp(notificationDataSource: NotificationDataSource());
}

abstract class NotificationRepo {
  Future<void> requestNotificationPermission();
  Future<void> setupInteractedMessage();
  Future<String?> getToken();
}
