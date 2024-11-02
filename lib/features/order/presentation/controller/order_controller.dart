import 'package:aji/core/config/Strings/app_strings.dart';
import 'package:aji/core/service/hive_service.dart';
import 'package:aji/features/cart/data/models/cart_item_model.dart';
import 'package:aji/features/order/data/models/category_id_model.dart';
import 'package:aji/features/order/data/models/sub_category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Login/data/models/sbus.dart';
import '../../../Main/presentation/controller/Main_controller.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
import '../../data/models/product_model.dart';
import '../../data/models/ware_house_model.dart';
import '../../data/models/ware_response_model.dart';
import '../../domain/usecase/order_use_case.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class OrderController extends GetxController implements GetxService {
  final OrderUseCase? orderUseCase;
  OrderController({this.orderUseCase});

  TextEditingController quantityText = TextEditingController(text: "1");

  TextEditingController rftController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  // TextEditingController quantityText = TextEditingController(text: kDebugMode ? "0" : "");
  TextEditingController cashAmountText =
      TextEditingController(text: kDebugMode ? "0" : "");
  TextEditingController creditAmountText =
      TextEditingController(text: kDebugMode ? "0" : "");

  TextEditingController deliveryAddress = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final payCate = ["Cash", "Credit", "Cash & Credit"].obs;
  final orderType = "regular".obs;
  var quantity = 1.obs;
  var rfl = 0.obs;
  var weight = 0.obs;
  var subtotal = 0.0.obs;
  var discountAmount = 0.0.obs;
  var totalAmount = 0.0.obs;
  var selectedIndex = 0.obs;
  var photoUploading = false.obs;

  final hiveService = HiveService.to;

  // Method to update quantity
  void updateQuantity(int newQuantity, Product? product) {
    quantity.value = newQuantity;
    //calculate rft
    rftController.text =
        (double.parse(product?.rft ?? "0.0") * newQuantity).toString();
    print(newQuantity);
    //calculate weight
    weightController.text =
        ((double.parse(product?.weight ?? "0.0")) * newQuantity).toString();

    final price = (product?.offerPrice ?? 0) <= 0
        ? (product?.regularPrice ?? 0)
        : (product?.offerPrice ?? 0);

    _updateSubtotal(price.toDouble());
  }

  // Method to update discount
  void updateDiscount(double discount) {
    discountAmount.value = discount;
    _updateTotalAmount();
  }

  // Method to update subtotal based on quantity
  void _updateSubtotal(double? price) {
    subtotal.value = quantity.value * (price ?? 0);
    _updateTotalAmount();
  }

  // Method to calculate the total amount
  void _updateTotalAmount() {
    totalAmount.value = subtotal.value - discountAmount.value;
  }

  final status = [
    'All',
    'Cancel',
    'Received',
    'Processing',
    'Return',
  ];

  // final category = [
  //   'PPC Cement ',
  //   'Xcel (PC)',
  //   'PCC',
  //   'Chaktiman (PPC)',
  //   'Chaktiman (PCC)',
  //   'PPC',
  // ];

  final _selectedStatus = 0.obs;
  int get selectedStatus => _selectedStatus.value;

  Rx<SubCategory?> selectSubCategory = Rx<SubCategory?>(null);
  Rx<CategoryId?> selectcatgeory = Rx<CategoryId?>(null);

  void updateSelectedStatus(int idx) {
    _selectedStatus.value = idx;
  }

  // Update the selected index to the one that is clicked
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  final pickImage = ''.obs;
  final pickCheque = ''.obs;

  final ImagePicker _picker = ImagePicker();
  Future<void> captureImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      pickImage.value = photo.path;
      print("Image path: ${photo.path}");
    }
  }

  final pickCheck = ''.obs;

  final ImagePicker _picker1 = ImagePicker();
  Future<void> pickFile({String? type, String? fileType}) async {
    photoUploading.value = true;
    final XFile? photo = fileType == "image"
        ? await _picker.pickImage(
            source:
                type == "gallery" ? ImageSource.gallery : ImageSource.camera)
        : await _picker1.pickImage(
            source:
                type == "gallery" ? ImageSource.gallery : ImageSource.camera);
    if (photo != null) {
      var res = await orderUseCase!.uploadPhoto(photo.path);
      photoUploading.value = false;
      res.fold((l) {
        // Logger().e("Error ${l.message}");
        Fluttertoast.showToast(
            msg: l.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }, (r) async {
        // Logger().w(r.userLogin!.data!.nid);
        fileType == "image"
            ? pickImage.value = r.body ?? ''
            : pickCheque.value = r.body ?? '';
      });
    } else {
      photoUploading.value = false;
    }
  }

  /// date picker
  final selectedDate = ''.obs;
  void pickedDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1999, 12, 10), // Initial date for the picker
      firstDate: DateTime(1900), // Earliest date you can pick
      lastDate: DateTime.now(), // Latest date is today
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      selectedDate.value = formattedDate; // Update the observable date
    }
  }

  final check = false.obs;

  selectCheck(value) {
    check.value = value;
    update();
  }

  //--------------------------------fetch product data
  final _productLoading = false.obs;
  bool get productLoading => _productLoading.value;

  final _moreLoading = false.obs;
  bool get moreLoading => _moreLoading.value;

  final _productList = <Product>[].obs;
  List<Product> get productList => _productList;

  ///product list===============
  void getProducts({String? categoryId, String? subCategoryId}) async {
    _productLoading.value = true;

    final res = await orderUseCase!(GetOrderParams(queryParameters: {
      "limit": "0",
      "pageNo": "0",
      "sbuId": "",
      "categoryId": categoryId ?? "",
      "subCategoryId": subCategoryId ?? "",
      "status": "true"
    }));

    _productLoading.value = false;

    res.fold((l) {
      // Logger().e("Error ${l.message}");
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      _productLoading.value = false;
    }, (r) async {
      // Logger().w(r.userLogin!.data!.nid);
      _productList.value = r.products ?? [];
    });
  }

  /// Ware house===============

  Rx<WareHouseResposeModel?> wareResponse = Rx<WareHouseResposeModel?>(null);
  Rx<Warehouse?> warehouse = Rx<Warehouse?>(null);
  final isLoading = false.obs;

  Future getWareHouse() async {
    isLoading.value = true;
    wareResponse.value = null;
    warehouse.value = null;
    final res = await orderUseCase!.getWareHouse();
    isLoading.value = false;
    res.fold((l) {
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) async {
      wareResponse.value = r;
      print(r.warehouses!.length);
    });
  }

  ///create order===============
  final orderLoading = false.obs;
  Future createOrder(
      {String? sbuId,
      String? sbuShortName,
      String? warehouseId,
      String? totalAmount,
      String? discountAmount,
      String? netAmount,
      List<dynamic>? orderDetails}) async {
    Sbus? sbuId = Get.find<MainController>().selectSbu.value!;
    orderLoading.value = true;

    CartController cartController = Get.find<CartController>();

    final orderDetails = List.generate(
        cartController.cartList.length,
        (index) => {
              "productId": cartController.cartList[index].product?.id,
              "unitPrice": cartController.cartList[index].product?.regularPrice,
              "offeredPrice":
                  cartController.cartList[index].product?.offerPrice,
              "salesPrice":
                  ((cartController.cartList[index].product?.offerPrice ?? 0) <=
                          0
                      ? cartController.cartList[index].product?.regularPrice
                      : cartController.cartList[index].product?.offerPrice),
              "declaredPrice":
                  cartController.cartList[index].product?.declaredPrice,
              "totalAmount": cartController.cartList[index].totalAmount,
              "discountAmount": cartController.cartList[index].discountAmount,
              "netAmount": cartController.cartList[index].subTotal,
              "orderQuantity": cartController.cartList[index].quantity,
              "rft": cartController.cartList[index].rft,
              "weight": cartController.cartList[index].weight,
              "deliveredQuantity": 0
            });

    final res = await orderUseCase!.createOrder(
        sbuId: sbuId != null ? sbuId!.id : "",
        sbuShortName: sbuId != null ? sbuId!.fullName : "",
        warehouseId: warehouse.value!.id ?? '',
        totalAmount: cartController.totalAmount.toString(),
        discountAmount: cartController.totalDiscount.toString(),
        netAmount: cartController.totalAmount.toString(),
        cashAmount: cashAmountText.text,
        creditAmount: creditAmountText.text,
        depositFile: pickImage.value,
        chequeFile: pickCheque.value,
        dateOfHonor: selectedDate.value,
        contactDetails: phoneController.text,
        orderType:orderType.value,
        paymentType: selectedIndex.value == 0 ? "Cash"
            : selectedDate.value == 1
                ? "Credit"
                : "Both",
        deliveryAddress: deliveryAddress.text,
        orderDetails: orderDetails);
    orderLoading.value = false;
    res.fold((l) {
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (r) async {
      Fluttertoast.showToast(
          msg: "Order Create Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  ///add to cart
  void addToCart(CartItemModel? product, {void Function()? success}) async {
    if (product != null) {
      // Store the data first
      bool isAdded = await HiveService.to.storeData<CartItemModel>(
        data: product,
        boxName: AppStrings.productBox,
      );

      if (isAdded) {
        debugPrint("Successfully added to cart");
        // Now that it's successfully added to the box, save the product
        product.save(); // This will associate the product with the box
        Get.find<CartController>().fetchCartList();
        if (success != null) {
          success();
        }
      }
    }
  }

  ///get categories
  var category = <CategoryId>[].obs;
  var subCategory = <SubCategory>[].obs;
  var filteredSubCategory = <SubCategory>[].obs;
  var categoryLoading = false.obs;

  void getCategories() async {
    categoryLoading.value = true;

    String id = Get.find<MainController>().selectSbu.value?.id ?? " ";
    final query = {"sbuId": "${id}"};

    final res = await orderUseCase!.getCategories(query);
    categoryLoading.value = false;

    res.fold((l) {
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      categoryLoading.value = false;
    }, (r) async {
      category.value = r.categories ?? [];
      subCategory.value = r.subCategories ?? [];
    });
  }

  ///get order history
  var orderHistoryLoading = false.obs;

  void getOrderHistory() async {
    orderHistoryLoading.value = true;

    final query = {"": ""};

    final res = await orderUseCase!.getOrderHistory(query);
    orderHistoryLoading.value = false;

    res.fold((l) {
      Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      orderHistoryLoading.value = false;
    }, (r) async {});
  }
}
