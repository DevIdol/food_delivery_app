import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../auth/auth_provider.dart';

class UserProvider extends StateNotifier<AsyncValue<dynamic>> {
  Ref ref;

  UserProvider({
    required this.ref,
  }) : super(const AsyncData(null));

// Login
  Future<Either<String, bool>> login(
      {required String email, required String password}) async {
    state = const AsyncLoading();

    UserRequest userReq = UserRequest(email: email, password: password);
    final response = await ref.read(userRepositoryProvider).login(userReq);
    if (response is ErrorModel) {
      return const Left('Unexpected response from server');
    } else {
      ref.read(setAuthStateProvider.notifier).state = response;
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAuthenticatedUserProvider(response.user));
      return const Right(true);
    }
  }

  // logout
  Future<dynamic> logout() async {
    return await ref.read(resetStorage);
  }
}

final userNotifierProvider =
    StateNotifierProvider<UserProvider, AsyncValue<dynamic>>((ref) {
  return UserProvider(ref: ref);
});
