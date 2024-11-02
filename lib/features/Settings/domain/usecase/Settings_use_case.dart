import 'package:aji/features/Login/data/models/login_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../More/data/models/user_profile_model.dart';
import '../repositories/Settings_repository.dart';
import '../../../../core/usecase/usecase.dart';

class SettingsUseCase implements UseCase<dynamic, GetSettingsParams> {
  final SettingsRepository? settingsRepository;
  SettingsUseCase({this.settingsRepository});


  @override
  Future<Either<Failure, dynamic>> call(GetSettingsParams params) {
    return settingsRepository!.changePassword(params.body);
  }

  @override
  Future<Either<Failure, UserProfileResponseModel>> getUserProfile() {
    return settingsRepository!.getUserProfile();
  }

}

class GetSettingsParams {
  final Map<String, dynamic> body;

  GetSettingsParams({required this.body});
}
