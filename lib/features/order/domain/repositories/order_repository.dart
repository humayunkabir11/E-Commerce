import 'package:aji/core/common/data/sucesss/sucess_model.dart';
import 'package:aji/features/order/data/models/category_response.dart';
import 'package:aji/features/order/data/models/order_history_response.dart';
import 'package:aji/features/order/data/models/poduct_response_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/ware_response_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, ProductResponseModel>> fetchProducts(
      dynamic queryParameters);
  Future<Either<Failure, WareHouseResposeModel>>getWareHouse();
  Future<Either<Failure, SucessModel>> createOrder(
      {String? sbuId,
      String? sbuShortName,
      String? warehouseId,
      String? totalAmount,
      String? discountAmount,
      String? netAmount,
      String? orderType,
      String? deliveryAddress,
      List? orderDetails,
        String? cashAmount, String? creditAmount, String? depositFile, String? chequeFile, String? dateOfHonor, String? contactDetails, required String paymentType});

  Future<Either<Failure, SucessModel>> uploadPhoto(String path);

  Future<Either<Failure, CategoryResponse>> getCategories(dynamic queryParameters);
  Future<Either<Failure, OrderHistoryResponse>> getOrderHistory(dynamic queryParameters);

}
