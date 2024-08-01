import 'package:flutter_push_notification/features/push_notification/domain/entity/notification_entity.dart';
import 'package:flutter_push_notification/features/push_notification/domain/use_case/notification_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  @override
  Future<void> build() async {}

  void notificationController() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref.read(notificationUseCaseProvider).setupInteractedMessage();
    });
  }
}
