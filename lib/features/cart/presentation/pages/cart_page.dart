import 'package:aji/core/common/widgets/card/product_cart.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/features/cart/presentation/controller/cart_controller.dart';
import 'package:aji/features/cart/presentation/widget/new_order_bottom.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/card/bottom_card.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../order/presentation/widget/category_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();
    controller.fetchCartList();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('My Cart (${controller.cartList.length})')),
        actions: [
          TextButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
                  context: context,
                  builder: (BuildContext context) {
                    return NewOrderBottom(
                      onSimpleOrder: () {
                        context.pushNamed(Routes.orderPage);
                      },
                      onRegularOrder: () {
                        context.pushNamed(Routes.orderPage);
                      },
                    );
                  },
                );
              },
              child: CustomText(
                text: '+  New Order',
                style: robotoSemiBold.copyWith(
                    color: AppColors.primaryColor, fontSize: 16.sp),
              ))
        ],
      ),
      body: Column(
        children: [
          /// =========product list
          Expanded(
            child: Obx(() => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
                  child: Row(
                    children: [
                      CategoryTile(
                        isSelected:controller.slectOrderType.value=="Regular",
                        onTap: () {
                          controller.slectOrderType.value="Regular";
                          Get.find<OrderController>().orderType.value="Regular";
                          controller.cartListCopy.value= controller.cartList.where((test)=>test.orderType=="Regular").toList();

                        },
                        text:"Regular",
                      ),
                      SizedBox(width: 12,),
                      CategoryTile(
                        isSelected:controller.slectOrderType.value=="Sample",
                        onTap: () {
                          controller.slectOrderType.value="Sample";
                          Get.find<OrderController>().orderType.value="Sample";
                          controller.cartListCopy.value= controller.cartList.where((test)=>test.orderType=="Sample").toList();
                        },
                        text:"Sample",
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: controller.cartListCopy.length,
                    itemBuilder: (context, index) {
                      return ProductCart(
                        brandName: controller.cartListCopy[index].product?.name,
                        offerPrice:
                            "${controller.cartListCopy[index].product?.offerPrice ?? 0}",
                        productImage: controller.cartListCopy[index].product?.image,
                        disCount: "${controller.cartListCopy[index].discountAmount ?? 0}",
                        itemQty: "${controller.cartListCopy[index].quantity ?? 0}x",
                        subTotalTitle: "",
                        subTotalAmout: "",
                        divider: VerticalDashedDivider(),
                        icons: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  context.pushNamed(Routes.updateItemPage,
                                      extra: controller.cartListCopy[index],
                                  );
                                },
                                child: Assets.icons.icEdit1
                                    .svg(color: AppColors.primarySlate200)),
                            SizedBox(
                              height: 80,
                            ),
                            InkWell(
                                onTap: () {
                                  controller.deleteItem(controller.cartListCopy[index]);
                                },
                                child: Assets.icons.icClose
                                    .svg(color: AppColors.primarySlate200)),
                          ],
                        ),
                      );
                    }),
              ],
            )),
          ),

          /// ===========  bottom part
          Obx(()=>BottomCard(
            subTotal: controller.subTotal.toString(),
            discountA: controller.totalDiscount.toString(),
            totalAmount: controller.totalAmount.toString(),
            itemQty: controller.totalQuantity.toInt().toString(),
            buttonText: "Proceed to Order",
            onTap: () {
              context.pushNamed(Routes.placeOrderPage);
            },
            isCheckBox: SizedBox(),
            summary: SizedBox(),
          ))
        ],
      ),
    );
  }
}
