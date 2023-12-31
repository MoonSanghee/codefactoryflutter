import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middlelevel/common/const/data.dart';
import 'package:middlelevel/common/dio/dio.dart';
import 'package:middlelevel/user/model/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_me_repository.g.dart';

final userMeRepositoryProvider = Provider<UserMeRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    return UserMeRepository(dio, baseUrl: 'http://$ip/user/me');
  },
);

// http://%ip/user/me
@RestApi()
abstract class UserMeRepository {
  factory UserMeRepository(Dio dio, {String baseUrl}) = _UserMeRepository;

  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<UserModel> getMe();
}
