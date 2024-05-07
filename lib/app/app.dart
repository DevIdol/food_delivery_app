import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants/constants.dart';
import '../routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogin = true | false;
    String initialRoute = isLogin ? AppRoute.login : AppRoute.home;

    return GetMaterialApp(
      title: 'Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: pages,
    );
  }
}
