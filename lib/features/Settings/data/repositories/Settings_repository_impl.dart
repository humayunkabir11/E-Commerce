import 'package:aji/core/error/failures.dart';
import 'package:aji/features/Login/data/models/login_model.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../../../More/data/models/user_profile_model.dart';
import '../datasource/Settings_remote_source.dart';
import '../../domain/repositories/Settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteSource remoteSource;
  final ConnectionChecker connectionChecker;

  SettingsRepositoryImpl(
      {required this.remoteSource, required this.connectionChecker});

  @override
  Future<Either<Failure, dynamic>> changePassword(body) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.changePassword(body);
        if (data == null) {
          return left(Failure("failed to change password"));
        } else {
          if(data['status'] == 'success'){
            return right(data);
          }
          return left(data);
        }
        // return right(episodes!.results!);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserProfileResponseModel>> getUserProfile() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.getUserProfile();
        if (data.status == null) {
          return left(Failure(data.status??""));
        } else {
          return right(data);
        }
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

}
