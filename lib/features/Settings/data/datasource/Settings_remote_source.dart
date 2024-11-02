import 'package:aji/features/Login/data/models/login_model.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../../../More/data/models/user_profile_model.dart';

abstract class SettingsRemoteSource {
  Future<dynamic> changePassword(dynamic body);
  Future<UserProfileResponseModel> getUserProfile();


}

class SettingsRemoteSourceImpl implements SettingsRemoteSource {
  final ApiMethod apiMethod;
  SettingsRemoteSourceImpl({required this.apiMethod});

  @override
  Future changePassword(body) async {
    try {
      final result = await apiMethod.patch(
          url: ApiEndpoint.CHANGE_DEALER_PASSWORD,
          body: body,
          showResult: true,
          isBasic: false,
          duration: 30);
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserProfileResponseModel> getUserProfile() async{
    try{
      final result =await apiMethod.get(url: ApiEndpoint.USER_PROFILE,showResult: true,isBasic: false,duration: 30);

      return UserProfileResponseModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

}
