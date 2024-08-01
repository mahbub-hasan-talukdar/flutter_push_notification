import 'package:flutter_push_notification/features/push_notification/data/data_source/notification_data_source.dart';
import 'package:flutter_push_notification/features/push_notification/domain/repository/notification_repository.dart';

class NotificationRepoImp implements NotificationRepo {
  NotificationDataSource notificationDataSource;
  NotificationRepoImp({required this.notificationDataSource});

  @override
  Future<void> setupInteractedMessage() async {
    notificationDataSource.setupInteractedMessage();
  }

  @override
  Future<void> requestNotificationPermission() async {
    notificationDataSource.requestNotificationPermission();
  }

  @override
  Future<String?> getToken() async {
    return await notificationDataSource.getDeviceToken();
  }
}
