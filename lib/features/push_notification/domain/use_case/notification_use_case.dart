import 'dart:async';

import 'package:flutter_push_notification/features/push_notification/domain/repository/notification_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_use_case.g.dart';

@riverpod
NotificationUseCase notificationUseCase(Ref ref) {
  final notificationRepository = ref.read(notificationRepoProvider);
  return NotificationUseCase(notificationRepo: notificationRepository);
}

class NotificationUseCase {
  NotificationRepo notificationRepo;
  NotificationUseCase({required this.notificationRepo});

  Future<void> getDevicePermission() async {
    return notificationRepo.requestNotificationPermission();
  }

  Future<void> setupInteractedMessage() async {
    notificationRepo.setupInteractedMessage();
  }

  Future<String?> getToken() async {
    return await notificationRepo.getToken();
  }
}
