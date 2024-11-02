import 'package:aji/core/common/data/sucesss/sucess_model.dart';
import 'package:aji/core/error/failures.dart';
import 'package:aji/features/order/data/models/category_response.dart';
import 'package:aji/features/order/data/models/order_history_response.dart';

import 'package:aji/features/order/data/models/poduct_response_model.dart';

import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/order_remote_source.dart';
import '../../domain/repositories/order_repository.dart';
import '../models/ware_response_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteSource remoteSource;
  final ConnectionChecker connectionChecker;

  OrderRepositoryImpl(
      {required this.remoteSource, required this.connectionChecker});

  @override
  Future<Either<Failure, ProductResponseModel>> fetchProducts(
      queryParameters) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.getProducts(queryParameters);
        if (data!.status != "success") {
          return left(Failure("Failed to fetch products!"));
        } else {
          return right(data);
        }
        // return right(episodes!.results!);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }




  Future<Either<Failure, SucessModel>> createOrder(
      {
        String? sbuId,
        String? sbuShortName,
        String? warehouseId,
        String? totalAmount,
        String? discountAmount,
        String? netAmount,
        String? orderType,
        String? paymentType,
        String? deliveryAddress,
        List<dynamic>? orderDetails,
        String? cashAmount,
        String? creditAmount,
        String? depositFile,
        String? chequeFile,
        String? dateOfHonor,
        String? contactDetails
      }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.createOrder(
            sbuId: sbuId,
            sbuShortName: sbuShortName,
            warehouseId: warehouseId,
            totalAmount: totalAmount,
            netAmount: netAmount,
            orderType: orderType,
            paymentType: paymentType,
            deliveryAddress: deliveryAddress,
            orderDetails: orderDetails,
            cashAmount:cashAmount,
            creditAmount:creditAmount,
            depositFile:depositFile,
            chequeFile:chequeFile,
            dateOfHonor:dateOfHonor,
            contactDetails:contactDetails,
        );
        if (data!.status == false) {
          return left(Failure(data.message!));
        } else {
          return right(data);
        }
        // return right(episodes!.results!);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, WareHouseResposeModel>> getWareHouse() async{
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.getWareHouse();
        if (data!.status != "success") {
          return left(Failure("Failed to fetch data!"));
        } else {
          return right(data);
        }
        // return right(episodes!.results!);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, SucessModel>> uploadPhoto(String path)async {
    // TODO: implement uploadPhoto
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.uploadPhoto(path);
        if (data!.status != "success") {
          return left(Failure("Failed to fetch data!"));
        } else {
          return right(data);
        }
        // return right(episodes!.results!);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CategoryResponse>> getCategories(queryParameters) async{
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.getCategories(queryParameters);
        if (data!.status != "success") {
          return left(Failure("Failed to fetch data!"));
        } else {
          return right(data);
        }
        // return right(episodes!.results!);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory(queryParameters) async{
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      } else {
        final data = await remoteSource.getOrderHistory(queryParameters);
        if (data!.status == false) {
          return left(Failure(data.message!));
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
