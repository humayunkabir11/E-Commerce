import 'package:aji/core/error/failures.dart';

import 'package:aji/features/Login/data/models/login_model.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Login_remote_source.dart';
import '../../domain/repositories/Login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{

final LoginRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

LoginRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, LoginModel>> login(body) async{
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.login(body);

        if(data!.status!="success"){
          return left(Failure(data.message ?? ""));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, dynamic>> forgetPass( body)async {
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.forgetPass(body);

        if(data['status']!="success"){
          return left(Failure("Failed"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }


@override
Future<Either<Failure, dynamic>> getOtp( body)async {
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.getOtp(body);

      if(data['status']!="success"){
        return left(Failure(data.message??""));
      }else{
        return right(data);
      }
      // return right(episodes!.results!);
    }
  }on ServerException catch(e){
    return left(Failure(e.message));
  }
}

}