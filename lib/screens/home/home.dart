import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/providers.dart';
import '../../utils/utils.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModelAsync = ref.watch(getAuthenticatedUserProvider);

    return userModelAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
      data: (userModel) => Scaffold(
        appBar: AppBar(
          title: Text('${userModel.firstName} ${userModel.lastName}'),
          actions: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.logout),
              onPressed: () async {
                final isLogout =
                    await ref.read(userNotifierProvider.notifier).logout();
                if (isLogout) {
                  Get.offAllNamed(AppRoute.login);
                }
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Email: ${userModel.email}'),
              Text('Phone: ${userModel.phone}'),
              Text('Address: ${userModel.address}')
            ],
          ),
        ),
      ),
    );
  }
}
