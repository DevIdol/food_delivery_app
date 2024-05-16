import 'package:flutter/material.dart';
import 'package:food_app/screens/food/food_list_screen.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/providers.dart';
import '../../utils/utils.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery App'),
        actions: [
          IconButton(
            iconSize: 30,
            icon: const Icon(Icons.logout),
            onPressed: () async {
              ref
                  .read(userNotifierProvider.notifier)
                  .logout()
                  .then((value) => Get.offAllNamed(AppRoute.login));
            },
          ),
        ],
      ),
      body: const FoodListScreen(),
    );
  }
}
