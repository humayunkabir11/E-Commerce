import '/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///staging
  static const String mainDomain = "https://staging-agibackend-api.retail-x.org";
  static const String baseUrl = "$mainDomain";
  static const String imageBaseUrl = "https://staging-agibackend.sgp1.digitaloceanspaces.com/";

  ///------------------------------End point----------------------------------------

  static  String DEALER_LOGIN= '/dealer/v1/dealer-login'.addBaseURl;
  static  String CHANGE_DEALER_PASSWORD= '/dealer/v1/dealer-pass-update'.addBaseURl;
  static  String DEALER_FORGET_PASS= '/dealer/v1/dealer-pass-forget'.addBaseURl;
  static  String DEALER_RECOVER_PASS= '/dealer/v1/dealer-pass-recover'.addBaseURl;

  static  String USER_PROFILE= '/dealer/v1/get-me'.addBaseURl;
  static  String FETCH_PRODUCT_LIST= '/product/data'.addBaseURl;
  static  String WARE_HOUSE= '/warehouse/data'.addBaseURl;
  static  String CREATE_ORDER= '/app/order/create'.addBaseURl;
  static  String PRODUCT_CATEGORY= '/product-category/data-app'.addBaseURl;
  static  String ORDER_HISTORY= ''.addBaseURl;
  static  String GET_SLIDER_DATA = '/slide/data'.addBaseURl;


  static  String UPLOAD_PHOTO= '/dealer/v1/file-image-upload'.addBaseURl;

}
