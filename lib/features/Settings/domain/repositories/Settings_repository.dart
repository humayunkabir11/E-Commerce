import 'package:aji/features/Login/data/models/login_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../More/data/models/user_profile_model.dart';

abstract class SettingsRepository {
  Future<Either<Failure, dynamic>> changePassword(dynamic body);
  Future<Either<Failure, UserProfileResponseModel>> getUserProfile();

}
