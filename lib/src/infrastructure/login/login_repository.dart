import 'package:dio/dio.dart';
import 'package:fourkids/src/domain/core/api_end_points.dart';
import 'package:fourkids/src/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fourkids/src/domain/login/login_repo.dart';
import 'package:fourkids/src/domain/login/model/login.dart';
import 'package:injectable/injectable.dart';
import '../api_keys.dart';


@LazySingleton(as: LoginRepo)
class LoginRepository implements LoginRepo {
  @override
  Future<Either<MainFailures, Login>> getLoginData() async {
    try {
      final Response response = await Dio().post(ApiEndPoints.loginCheckPhone,
          data: {'phone': '7356722467', 'user_id': '194'},
          options: Options(headers: {tokenValidKey: loginTokkenValid}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(Login.fromJson(response.data));
      } else {
        return left(const MainFailures.serverFailures());
      }
    } catch (e) {
      return left(const MainFailures.clientFailures());
    }
  }
}
