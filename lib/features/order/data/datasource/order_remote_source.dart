import 'package:aji/core/common/data/sucesss/sucess_model.dart';
import 'package:aji/features/order/data/models/poduct_response_model.dart';
import 'package:aji/features/order/data/models/ware_response_model.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';
import '../models/category_response.dart';
import '../models/order_history_response.dart';

abstract class OrderRemoteSource {
  Future<ProductResponseModel?> getProducts(dynamic queryParameters);
  Future<WareHouseResposeModel?> getWareHouse();

  Future<SucessModel> createOrder({String? sbuId,
      String? sbuShortName,
      String? warehouseId,
      String? totalAmount,
      String? netAmount,
      String? orderType,
      String? deliveryAddress,
      List? orderDetails,
        String? cashAmount,
        String? creditAmount,
        String? depositFile,
        String? chequeFile,
        String? dateOfHonor,
        String? contactDetails, String? paymentType});

  Future<SucessModel?> uploadPhoto(String path);

  Future<CategoryResponse?> getCategories(dynamic queryParameters);

  Future<OrderHistoryResponse?> getOrderHistory(dynamic queryParameters);

}

class OrderRemoteSourceImpl implements OrderRemoteSource {
  final ApiMethod apiMethod;
  OrderRemoteSourceImpl({required this.apiMethod});

  @override
  Future<ProductResponseModel?> getProducts(queryParameters) async {
    try {
      final result = await apiMethod.get(
          url: ApiEndpoint.FETCH_PRODUCT_LIST,
          showResult: true,
          isBasic: false,
          duration: 30,
          queryParams: queryParameters);
      return ProductResponseModel.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WareHouseResposeModel> getWareHouse() async{
    try{
      final result = await apiMethod.get(url: ApiEndpoint.WARE_HOUSE,showResult: true,isBasic: false,duration: 30);

      return WareHouseResposeModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<SucessModel> createOrder({
    String? sbuId,
    String? sbuShortName,
    String? warehouseId,
    String? totalAmount,
    String? netAmount,
    String? discountAmount,
    String? orderType,
    String? paymentType,
    String? deliveryAddress,
    List? orderDetails,
    String? cashAmount,
    String? creditAmount,
    String? depositFile,
    String? chequeFile,
    String? dateOfHonor,
    String? contactDetails
  })async {
    Map<String, dynamic> data =
    {
      "cashAmount": cashAmount,
      "chequeFile": chequeFile,
      "contactDetails": contactDetails,
      "creditAmount":cashAmount,
      "dateOfHonor": dateOfHonor,
      "deliveryAddress": deliveryAddress,
      "depositFile": depositFile,
      "discountAmount": null,
      "itemDetails": orderDetails,
      "netAmount": netAmount,
      "orderType": orderType,
      "paymentType": paymentType,
      "sbuId": sbuId,
      "sbuShortName": sbuShortName,
      "totalAmount": totalAmount,
      "warehouseId": warehouseId
    };

    print(data);
    try{
      final result =await apiMethod.post(url: ApiEndpoint.CREATE_ORDER, body: data,showResult: true,isBasic: false,);
      return SucessModel.fromJson(result);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<SucessModel?> uploadPhoto(String path)async {
    // TODO: implement uploadPhoto
    try{
      final result =await apiMethod.multipartMultiFile(url: ApiEndpoint.UPLOAD_PHOTO, body: {}, showResult: true,isBasic: true, pathList: [path], fieldList: ["photo"],);
      return SucessModel.fromJson(result!);
    }catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CategoryResponse?> getCategories(queryParameters) async{
    try {
      final result = await apiMethod.get(
          url: ApiEndpoint.PRODUCT_CATEGORY,
          showResult: true,
          isBasic: false,
          duration: 30,
          queryParams: queryParameters);
      return CategoryResponse.fromJson(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<OrderHistoryResponse?> getOrderHistory(queryParameters) async{
    try {
      final result = await apiMethod.get(
          url: ApiEndpoint.ORDER_HISTORY,
          showResult: true,
          isBasic: false,
          duration: 30,
          queryParams: queryParameters);
      return OrderHistoryResponse.fromJson(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

}
