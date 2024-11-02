import 'package:aji/core/common/data/sucesss/sucess_model.dart';
import 'package:aji/features/order/data/models/category_response.dart';
import 'package:aji/features/order/data/models/order_history_response.dart';
import 'package:aji/features/order/data/models/poduct_response_model.dart';
import 'package:aji/features/order/data/models/ware_response_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';

import '../repositories/order_repository.dart';
import '../../../../core/usecase/usecase.dart';

class OrderUseCase implements UseCase<ProductResponseModel, GetOrderParams> {
  final OrderRepository? orderRepository;
  OrderUseCase({this.orderRepository});

  @override
  Future<Either<Failure, ProductResponseModel>> call(
      GetOrderParams params) async {
    return await orderRepository!.fetchProducts(params.queryParameters);
  }

  @override
  Future<Either<Failure, SucessModel>> createOrder(
      {String? sbuId,
      String? sbuShortName,
      String? warehouseId,
      String? totalAmount,
      String? discountAmount,
      String? netAmount,
      String? orderType,
      String? deliveryAddress,
      List<dynamic>? orderDetails,
      String? cashAmount,
      String? creditAmount,
      String? depositFile,
      String? chequeFile,
      String? dateOfHonor,
      String? contactDetails, required String paymentType}) {
    // TODO: implement callgetOtp
    return orderRepository!.createOrder(
        sbuId: sbuId,
        sbuShortName: sbuShortName,
        warehouseId: warehouseId,
        totalAmount: totalAmount,
        discountAmount: discountAmount,
        netAmount: netAmount,
        orderType: orderType,
        paymentType: paymentType,
        deliveryAddress: deliveryAddress,
        orderDetails: orderDetails,
        cashAmount: cashAmount,
        creditAmount: creditAmount,
        depositFile: depositFile,
        chequeFile: chequeFile,
        dateOfHonor: dateOfHonor,
        contactDetails: contactDetails);
  }

  Future<Either<Failure, WareHouseResposeModel>> getWareHouse() {
    return orderRepository!.getWareHouse();
  }

  Future<Either<Failure, SucessModel>> uploadPhoto(String path) async {
    return orderRepository!.uploadPhoto(path);
  }

  Future<Either<Failure, CategoryResponse>> getCategories(
      Map<String, String> queryParameters) async {
    return orderRepository!.getCategories(queryParameters);
  }

  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory(
      Map<String, String> queryParameters) async {
    return orderRepository!.getOrderHistory(queryParameters);
  }
}

class GetOrderParams {
  final Map<String, String>? queryParameters;

  GetOrderParams({
    this.queryParameters,
  });
}
