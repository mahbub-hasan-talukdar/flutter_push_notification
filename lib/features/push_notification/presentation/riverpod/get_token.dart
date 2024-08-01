import 'package:flutter_push_notification/features/push_notification/domain/use_case/notification_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_token.g.dart';

@riverpod
class GetToken extends _$GetToken {
  @override
  Future<String?> build() async {
    return null;
  }

  void getToken() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref.read(notificationUseCaseProvider).getToken();
      return null;
    });
  }
}
