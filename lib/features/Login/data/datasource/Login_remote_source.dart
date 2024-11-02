import 'package:aji/features/Login/data/models/login_model.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class LoginRemoteSource {
  Future<LoginModel?> login(dynamic body);
  Future<dynamic> forgetPass(dynamic body);
  Future<dynamic> getOtp(dynamic body);

}

class LoginRemoteSourceImpl implements LoginRemoteSource {
  final ApiMethod apiMethod;
  LoginRemoteSourceImpl({required this.apiMethod});

  @override
  Future<LoginModel?> login(body) async {
    try {
      final result = await apiMethod.post(url: ApiEndpoint.DEALER_LOGIN,
          body: body, showResult: true, isBasic: true, duration: 30);
      return LoginModel.fromJson(result ?? {});
    } catch (e) {
      print("ERROR: $e");
      throw ServerException(e.toString());
    }
  }

  @override
  Future<dynamic> forgetPass(body) async {
    try {
      final result = await apiMethod.patch(url: ApiEndpoint.DEALER_FORGET_PASS,
          body: body, showResult: true, isBasic: true, duration: 30);
      return result;
    } catch (e) {
      print("ERROR: $e");
      throw ServerException(e.toString());
    }
  }


  @override
  Future<dynamic> getOtp(body) async {
    try {
      final result = await apiMethod.patch(url: ApiEndpoint.DEALER_RECOVER_PASS,
          body: body, showResult: true, isBasic: true, duration: 30);
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

}
