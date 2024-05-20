import 'package:flutter/material.dart';
import 'package:food_app/providers/tab_provider/tab_notifier.dart';
import 'package:food_app/screens/contact/contact.dart';
import 'package:food_app/screens/food/food_list_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/providers.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navigationNoifierProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.call), label: 'Contact')
        ],
        selectedIndex: index,
        onDestinationSelected: (value) => {
          ref.read(navigationNoifierProvider.notifier).setSelectedIndex(value)
        },
      ),
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
      body: [
        const FoodListScreen(),
        const ContactScreen(),
      ][index],
    );
  }
}
