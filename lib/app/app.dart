import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';
import '../utils/constants/constants.dart';
import '../routes/routes.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      title: 'Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: pages,
      
      home: ref
          .watch(
            getIsAuthenticatedProvider,
          )
          .when(
            data: (bool isAuthenticated) =>
                isAuthenticated ? const HomeScreen() : const LoginScreen(),
            loading: () {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            error: (error, stacktrace) => const LoginScreen(),
          ),
    );
  }
}
