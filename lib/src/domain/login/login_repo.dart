import 'package:dartz/dartz.dart';
import 'package:fourkids/src/domain/core/failures/main_failures.dart';

import 'model/login.dart';

abstract class LoginRepo{
  Future<Either<MainFailures,Login>>getLoginData({required String phoneNo});
}