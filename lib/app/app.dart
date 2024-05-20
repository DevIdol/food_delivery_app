import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';
import '../utils/constants/constants.dart';
import '../routes/routes.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessTokenFuture =
        useMemoized(() => ref.read(getAccessTokenProvider.future), []);
    final refreshTokenFuture =
        useMemoized(() => ref.read(getRefreshTokenProvider.future), []);
    final isAuthenticatedAsync = ref.watch(getIsAuthenticatedProvider);

    useEffect(() {
      Future.microtask(() async {
        final accessToken = await accessTokenFuture;
        final refreshToken = await refreshTokenFuture;

        if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
          ref.read(setAccessTokenStateProvider.notifier).state = accessToken;
          ref.read(setRefreshTokenStateProvider.notifier).state = refreshToken;
        }
      });
      return null;
    }, [accessTokenFuture, refreshTokenFuture]);

    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Food App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.scaffoldBgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: pages,
      home: isAuthenticatedAsync.when(
        data: (bool isAuthenticated) =>
            isAuthenticated ? const HomeScreen() : const LoginScreen(),
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stacktrace) => const LoginScreen(),
      ),
    );
  }
}
