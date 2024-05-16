import 'package:flutter/material.dart';
import 'package:food_app/screens/food/food_list_screen.dart';
import 'package:food_app/screens/otp/verify_otp.dart';
import 'package:get/get.dart';
import '../utils/constants/constants.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

final pages = [
  GetPage(
    name: AppRoute.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignUpScreen(),
    customTransition: PageTransition(alignment: Alignment.topLeft),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
    customTransition: PageTransition(),
  ),
  GetPage(
    name: AppRoute.verifyOTP,
    page: () => const VerifyOTPScreen(),
    customTransition: PageTransition(),
  ),
  GetPage(
    name: AppRoute.food,
    page: () => const FoodListScreen(),
    customTransition: PageTransition(),
  ),
];
