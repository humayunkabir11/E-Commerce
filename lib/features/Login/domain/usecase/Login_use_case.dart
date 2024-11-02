import 'package:aji/features/Login/data/models/login_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../repositories/Login_repository.dart';
import '../../../../core/usecase/usecase.dart';

class LoginUseCase implements UseCase<LoginModel,GetLoginParams > {
  final LoginRepository? loginRepository;
  LoginUseCase({this.loginRepository});

  @override
  Future<Either<Failure, LoginModel>> call(GetLoginParams params) {
   return loginRepository!.login(params.body);
  }


  @override
  Future<Either<Failure, dynamic>> forgetPass({Map<String, dynamic> ?body}) {
    return loginRepository!.forgetPass(body);
  }

  @override
  Future<Either<Failure, dynamic>>  getOtp({required Map<String, String> body})  {
    return loginRepository!.getOtp(body);
  }




}

class GetLoginParams {
  final Map<String, dynamic> body;
  GetLoginParams({required this.body});
}
