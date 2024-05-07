import 'package:get/get.dart';
import '../utils/constants/constants.dart';
import '../screens/screens.dart';

final pages = [
  GetPage(
    name: AppRoute.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
  ),
];
