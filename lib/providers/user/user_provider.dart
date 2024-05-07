import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../auth/auth_provider.dart';

class UserProvider extends StateNotifier<AsyncValue<dynamic>> {
  Ref ref;

  UserProvider({
    required this.ref,
  }) : super(const AsyncData(null));

  Future<Either<String, bool>> login(
      {required String email, required String password}) async {
    state = const AsyncLoading();

    UserRequest userReq = UserRequest(email: email, password: password);
    final response = await ref.read(userRepositoryProvider).login(userReq);
    if (response is ErrorModel) {
      return Left(response.error.message);
    } else {
      ref.read(setAuthStateProvider.notifier).state = response;
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAuthenticatedUserProvider(response.user));
      return const Right(true);
    }

    // final prettyString =
    //     JsonEncoder.withIndent('  ').convert(response.toJson());
    // debugPrint(prettyString);
  }
}

final UserProviderProvider =
    StateNotifierProvider<UserProvider, AsyncValue<dynamic>>((ref) {
  return UserProvider(ref: ref);
});