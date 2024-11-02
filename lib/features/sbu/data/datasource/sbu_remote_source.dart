import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../../../More/data/models/user_profile_model.dart';

abstract class SbuRemoteSource {

Future<UserProfileResponseModel?> getSbuList();

// Future<LoginResponseModel?> login(String email,String deviceToken, String pass, bool isPg);

}


class SbuRemoteSourceImpl implements SbuRemoteSource {
    final ApiMethod apiMethod;
   SbuRemoteSourceImpl({required this.apiMethod});

    @override
    Future<UserProfileResponseModel>  getSbuList() async{
      try{
        final result =await apiMethod.get(url: ApiEndpoint.DEALER_LOGIN,showResult: true,isBasic: true,duration: 30);

        return UserProfileResponseModel.fromJson(result);
      }catch (e) {
        throw ServerException(e.toString());
      }
    }
}
