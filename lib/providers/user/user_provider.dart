import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../entities/entities.dart';
import '../../repositories/repositories.dart';
import '../providers.dart';

class UserProvider extends StateNotifier<AsyncValue<dynamic>> {
  Ref ref;

  UserProvider({
    required this.ref,
  }) : super(const AsyncData(null));

  //login
  Future<Either<String, bool>> login(
      {required String email, required String password}) async {
    state = const AsyncLoading();

    UserRequest userReq = UserRequest(email: email, password: password);
    try {
      final response = await ref.read(userRepositoryProvider).login(userReq);
      ref.read(setIsAuthenticatedProvider(true));
      ref.read(setAccessTokenStateProvider.notifier).state =
          response.accessToken;
      ref.read(setRefreshTokenStateProvider.notifier).state =
          response.refreshToken;
      ref.read(setAccessTokenProvider(response.accessToken!));
      ref.read(setRefreshTokenProvider(response.refreshToken));
      ref.read(setAuthStateProvider.notifier).state = response;

      ref.read(setAuthenticatedUserProvider(response.user));
      return const Right(true);
    } on HTTPResponse catch (error) {
      return Left(error.message);
    } catch (e) {
      return const Left('Failed to login');
    }
  }

  // Register
  Future<Either<String, bool>> signup(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String password,
      required String address}) async {
    state = const AsyncLoading();

    UserRegisterRequest userReq = UserRegisterRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
        address: address);

    try {
      final response = await ref.read(userRepositoryProvider).signup(userReq);
      ref.read(setUserRegisterStateProvider.notifier).state = userReq;
      ref.read(setAccessTokenStateProvider.notifier).state =
          response.accessToken;
      ref.read(setRefreshTokenStateProvider.notifier).state =
          response.refreshToken;
      return const Right(true);
    } on HTTPResponse catch (error) {
      return Left(error.message);
    } catch (e) {
      return const Left('Failed to signup!!');
    }
  }

  // Refresh Token
  Future<Either<String, bool>> refreshToken(
      {required String refreshToken}) async {
    state = const AsyncLoading();
    try {
      final response =
          await ref.read(userRepositoryProvider).refreshToken(refreshToken);
      final newAccessToken = response.accessToken;
      ref.read(setAccessTokenStateProvider.notifier).state = newAccessToken;
      ref.read(setAccessTokenProvider(newAccessToken!));
      return const Right(true);
    } on HTTPResponse catch (error) {
      return Left(error.message);
    } catch (e) {
      return const Left('Failed to refresh token');
    }
  }

  // Verify OTP
  Future<Either<String, UserRegisterRequest>> veriyOTP({otp, token}) async {
    state = const AsyncLoading();
    OTPRequest otpReq = OTPRequest(otp: int.parse(otp), token: token);
    try {
      await ref.read(userRepositoryProvider).verifyOTP(otpReq);
      UserRegisterRequest registerInfo =
          ref.watch(setUserRegisterStateProvider) as UserRegisterRequest;
      ref.read(resetStorage);
      return Right(registerInfo);
    } on HTTPResponse catch (error) {
      return Left(error.message);
    } catch (error) {
      return const Left('Failed to verify otp');
    }
  }

  // logout
  Future<bool> logout() async {
    ref.read(resetStorage);

    final authState = ref.read(setAuthStateProvider.notifier).state = null;

    final userInfo =
        ref.read(setUserRegisterStateProvider.notifier).state = null;

    final accessToken =
        ref.read(setAccessTokenStateProvider.notifier).state = null;
    final refreshToken =
        ref.read(setRefreshTokenStateProvider.notifier).state = null;
    if (authState == null &&
        userInfo == null &&
        accessToken == null &&
        refreshToken == null) {
      return true;
    } else {
      return false;
    }
  }
}

final userNotifierProvider =
    StateNotifierProvider<UserProvider, AsyncValue<dynamic>>((ref) {
  return UserProvider(ref: ref);
});
