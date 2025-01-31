import 'package:flutter/material.dart';
import 'package:flutter_push_notification/features/push_notification/presentation/riverpod/device_permission.dart';
import 'package:flutter_push_notification/features/push_notification/presentation/riverpod/get_token.dart';
import 'package:flutter_push_notification/features/push_notification/presentation/riverpod/notification_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    Future(() {
      ref.read(devicePermissionProvider.notifier).getDevicePermission();
      ref.read(getTokenProvider.notifier).getToken();
      ref
          .read(notificationControllerProvider.notifier)
          .notificationController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('This is Home page'),
      ),
    );
  }
}
