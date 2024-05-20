import 'package:flutter/material.dart';
import 'package:food_app/screens/food/food_list_screen.dart';
import 'package:food_app/widgets/widgets.dart';
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
              showConfirmDialog(
                  context: context,
                  title: 'Are you sure to logout?',
                  okFunc: () => ref
                      .read(userNotifierProvider.notifier)
                      .logout()
                      .then((value) => {
                            if (value)
                              {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRoute.login, (route) => false)
                              }
                          }));
            },
          ),
        ],
      ),
      body: const FoodListScreen(),
    );
  }
}
