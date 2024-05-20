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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: index,
          iconSize: 30,
          onTap: (value) {
            ref.read(navigationNoifierProvider.notifier).setSelectedIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 28),
              activeIcon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call_outlined, size: 28),
              activeIcon: Icon(Icons.call, size: 30),
              label: 'Call',
            ),
          ],
          selectedItemColor: AppColor.primaryColor,
          backgroundColor: AppColor.cardColor,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
        ),
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
