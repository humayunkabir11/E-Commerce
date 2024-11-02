import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../../../More/data/models/user_profile_model.dart';
import '../datasource/sbu_remote_source.dart';
import '../../domain/repositories/sbu_repository.dart';

class SbuRepositoryImpl implements SbuRepository{

final SbuRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

SbuRepositoryImpl({required this.remoteSource,required this.connectionChecker});


@override
Future<Either<Failure, UserProfileResponseModel>> getSbuList() async {
  try {
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    } else {
      final data = await remoteSource.getSbuList();
      if (data == null) {
        return left(Failure(data!.status??""));
      } else {
        return right(data);
      }
    }
  } on ServerException catch (e) {
    return left(Failure(e.message));
  }
}
}