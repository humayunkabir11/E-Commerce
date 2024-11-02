import 'package:aji/core/error/failures.dart';

import 'package:aji/features/Home/data/models/slider_response.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Home_remote_source.dart';
import '../../domain/repositories/Home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteSource remoteSource;
  final ConnectionChecker connectionChecker;

  HomeRepositoryImpl(
      {required this.remoteSource, required this.connectionChecker});

  @override
  Future<Either<Failure, SliderResponse>> getSliderData(
      Map<String, String> queryParameters) async {
    // TODO: implement getSliderData
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.getSliderData(queryParameters);
        if (data!.status != "success") {
          return left(Failure("Failed to fetch data"));
        } else {
          return right(data);
        }
        // return right(episodes!.results!);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

}
