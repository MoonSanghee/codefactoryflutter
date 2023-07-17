import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middlelevel/common/const/data.dart';
import 'package:middlelevel/secure_storage/secure_storage.dart';
import 'package:middlelevel/user/model/user_model.dart';
import 'package:middlelevel/user/repository/auth_repository.dart';
import 'package:middlelevel/user/repository/user_me_repository.dart';

final userMeProvider =
    StateNotifierProvider<UserMeStateNotifier, UserModelBase?>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final userMeRepository = ref.watch(userMeRepositoryProvider);
    final storage = ref.watch(secureStorageProvider);

    return UserMeStateNotifier(
      authRepository: authRepository,
      repository: userMeRepository,
      storage: storage,
    );
  },
);

class UserMeStateNotifier extends StateNotifier<UserModelBase?> {
  final AuthRepository authRepository;
  final UserMeRepository repository;
  final FlutterSecureStorage storage;

  UserMeStateNotifier({
    required this.authRepository,
    required this.repository,
    required this.storage,
  }) : super(UserModelLoading()) {
    // 내 정보 가져오기
    getMe();
  }

  getMe() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      state = null;
      return;
    }

    final resp = await repository.getMe();
  }

  Future<UserModelBase> login({
    required String username,
    required String password,
  }) async {
    try {
      state = UserModelLoading();

      final resp = await authRepository.login(
        username: username,
        password: password,
      );

      await storage.write(key: REFRESH_TOKEN_KEY, value: resp.refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.accessToken);

      final userResp = await repository.getMe();

      state = userResp;

      return userResp;
    } catch (e) {
      state = UserModelError(message: '로그인에 실패하였습니다.');

      return Future.value(state);
    }
  }

  Future<void> logout() async {
    state = null;

    // 두 값을 한번에 삭제
    await Future.wait(
      [
        storage.delete(key: REFRESH_TOKEN_KEY),
        storage.delete(key: ACCESS_TOKEN_KEY),
      ],
    );

    // 두 값을 차례대로 삭제
    // await storage.delete(key: REFRESH_TOKEN_KEY);
    // await storage.delete(key: ACCESS_TOKEN_KEY);
  }
}
