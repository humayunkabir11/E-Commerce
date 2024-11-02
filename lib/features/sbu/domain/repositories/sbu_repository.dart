import 'package:aji/core/error/failures.dart';
import 'package:aji/features/More/data/models/user_profile_model.dart';
import 'package:fpdart/src/either.dart';

abstract class SbuRepository {

  Future<Either<Failure, UserProfileResponseModel>> getSbuList();

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
