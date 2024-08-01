import 'package:flutter_push_notification/push_notification/domain/use_case/notification_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_permission.g.dart';

@riverpod
class DevicePermission extends _$DevicePermission {
  @override
  Future<void> build() async {}

  void getDevicePermission() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(notificationUseCaseProvider).getDevicePermission();
    });
  }
}
