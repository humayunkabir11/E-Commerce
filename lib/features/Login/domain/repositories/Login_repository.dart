import 'package:aji/features/Login/data/models/login_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login(dynamic body);

  Future<Either<Failure, dynamic>> forgetPass(dynamic body);

  Future<Either<Failure, dynamic>> getOtp(Map<String, String> body);
}
