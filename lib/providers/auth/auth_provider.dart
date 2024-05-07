import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../entities/entities.dart';
import '../../utils/utils.dart';

// SharedPreferences instance
final sharedPrefProvider = Provider((_) async {
  return await SharedPreferences.getInstance();
});

//To store auth state
final setAuthStateProvider = StateProvider<UserResponse?>(
  (ref) => null,
);

// To set the auth status
final setIsAuthenticatedProvider = StateProvider.family<void, bool>(
  (ref, isAuth) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    prefs.setBool(
      IS_AUTH_KEY,
      isAuth,
    );
  },
);

// To set the auth user data
final setAuthenticatedUserProvider = StateProvider.family<void, UserModel>(
  (ref, userData) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    prefs.setString(
      AUTH_USER_DATA_KEY,
      json.encode(userData),
    );
  },
);

//To get the auth status
final getIsAuthenticatedProvider = FutureProvider<bool>(
  (ref) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    return prefs.getBool(IS_AUTH_KEY) ?? false;
  },
);

// To get the auth user data
final getAuthenticatedUserProvider = FutureProvider<UserModel>(
  (ref) async {
    final prefs = await ref.watch(sharedPrefProvider);
    ref.watch(setAuthStateProvider);
    dynamic user = json.decode(prefs.getString(AUTH_USER_DATA_KEY) ?? "");
    return UserModel.fromJson(user);
  },
);

// To reset the storage (clear SharedPreferences)
final resetStorage = StateProvider<dynamic>(
  (ref) async {
    final prefs = await ref.watch(sharedPrefProvider);
    final isCleared = await prefs.clear();
    return isCleared;
  },
);