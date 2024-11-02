import 'package:aji/features/cart/data/models/cart_item_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../../core/config/Strings/app_strings.dart';
import '../../../../core/service/hive_service.dart';
import '../../../order/presentation/controller/order_controller.dart';
import '../../domain/usecase/cart_use_case.dart';

class CartController extends GetxController implements GetxService {
  final CartUseCase? cartUseCase;

  CartController({this.cartUseCase});

  final check = false.obs;

  selectCheck(value) {
    check.value = value;
    update();
  }

  //-------------------------------get the cart list data
  final cartList = <CartItemModel>[].obs;
  final cartListCopy = <CartItemModel>[].obs;

  var subTotal = 0.0.obs;
  var totalDiscount = 0.0.obs;
  var totalAmount = 0.0.obs;
  var totalQuantity = 0.0.obs;

  var slectOrderType = "Regular".obs;

  Future<void> fetchCartList() async {
    await HiveService.to.openBox<CartItemModel>(AppStrings.productBox);
    cartList.assignAll(Hive.box<CartItemModel>(AppStrings.productBox).values.toList()); // Load initial data
    cartListCopy.value= cartList.where((test)=>test.orderType==slectOrderType.value).toList();
    Get.find<OrderController>().orderType.value="Regular";
    updateCartTotals(); // Calculate totals after fetching data
  }

  //-----------------------------update cart totals
  void updateCartTotals() {
    subTotal.value =
        cartList.fold(0, (sum, item) => sum + (item.subTotal ?? 0));
    totalDiscount.value =
        cartList.fold(0, (sum, item) => sum + (item.discountAmount ?? 0));
    totalAmount.value =
        cartList.fold(0, (sum, item) => sum + (item.totalAmount ?? 0));
    totalQuantity.value =
        cartList.fold(0, (sum, item) => sum + (item.quantity ?? 0));
  }

  //-----------------------------delete from cart
  void deleteItem(CartItemModel product) async {
    cartList.remove(product);
    await product.delete();
    updateCartTotals(); // Update totals after item deletion
  }
}
