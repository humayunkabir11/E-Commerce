import 'package:aji/core/common/widgets/card/bottom_card.dart';
import 'package:aji/core/common/widgets/card/product_cart.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:aji/features/order/presentation/widget/delivery_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
import '../../../cart/presentation/widget/new_order_bottom.dart';
import '../widget/success_bottom.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proceed to Checkout'),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.updateItemPage);
              },
              icon: Assets.icons.icEdit1.svg(color: AppColors.primarySlate500))
        ],
      ),
      body: GetBuilder<OrderController>(
          builder: (controller) {
        final CartController cartController = Get.find<CartController>();
        final cartList = cartController.cartList;

        return ListView(
          children: [
            Obx(() => Column(
                  children: List.generate(
                      cartList.length,
                      (index) => ProductCart(
                            brandName: cartList[index].product?.name,
                            offerPrice: "${cartList[index].product?.offerPrice}",
                            disCount: cartList[index].discountAmount.toString(),
                            itemQty: cartList[index].quantity.toString(),
                            subTotalTitle: "",
                            subTotalAmout: cartList[index].discountAmount.toString(),
                            productImage: cartList[index].product?.image,
                            divider: VerticalDashedDivider(),
                            icons: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      context.pushNamed(
                                        Routes.updateItemPage,
                                        extra: cartList[index],
                                      );
                                    },
                                    child: Assets.icons.icEdit1
                                        .svg(color: AppColors.primarySlate200)),
                                SizedBox(
                                  height: 80,
                                ),
                                InkWell(
                                    onTap: () {
                                      Get.find<CartController>()
                                          .deleteItem(cartList[index]);
                                    },
                                    child: Assets.icons.icClose
                                        .svg(color: AppColors.primarySlate200)),
                              ],
                            ),
                          )),
                )),

            Container(
              margin: EdgeInsets.only(top: 12),
              color: AppColors.whiteColor,
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Assets.icons.payment.svg(),
                  CustomText(
                    left: 12,
                    text: "Payment Method",
                    style: robotoSemiBold.copyWith(
                        color: Color(0xff4A72FF), fontSize: 18.sp),
                  ),
                  Spacer(),
                  CustomText(
                    left: 12,
                    text: controller.selectedIndex.value==0?"Cash":controller.selectedIndex.value==1?"Credit":"Case and Credit",
                    style: robotoSemiBold.copyWith(
                        color: Color(0xff11A75C), fontSize: 16.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),

            /// Delivert information

            DeliveryInformation(
              icons: SizedBox(),
            ),

            BottomCard(
              subTotal: cartController.subTotal.toString(),
              discountA: cartController.totalDiscount.toString(),
              totalAmount: cartController.totalAmount.toString(),
              itemQty: cartController.totalQuantity.toInt().toString(),
              buttonText: "Place Order",
              deliveryCharge: "Delivery Charge (BDT):",
              onTap: () {
                controller.createOrder();
                showModalBottomSheet<void>(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
                  context: context,
                  builder: (BuildContext context) {
                    return SuccessBottom();
                  },
                );
              },
            )
          ],
        );
      }),
    );
  }
}
