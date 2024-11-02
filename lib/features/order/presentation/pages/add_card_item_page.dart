import 'package:aji/core/common/widgets/card/bottom_card.dart';
import 'package:aji/core/common/widgets/card/product_cart.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/Strings/api_endpoint.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/core/custom_assets/assets.gen.dart';
import 'package:aji/features/order/data/models/product_model.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../cart/data/models/cart_item_model.dart';
import '../widget/products_details.dart';
import '../widget/success_bottom.dart';

class AddCartItemPage extends StatelessWidget {
  final Product? product;
  final bool isForEdit;

  const AddCartItemPage({super.key, this.product, this.isForEdit = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Update by Item'),
      ),
      body: GetBuilder<OrderController>(builder: (controller) {
        controller.rftController.text = (product?.rft ?? "0.0").toString();
        controller.weightController.text =
            (product?.weight ?? "0.0").toString();
        controller.updateQuantity(1, product);

        return Obx(() {
          return ListView(
            children: [
              ProductCart(
                productImage: ApiEndpoint.imageBaseUrl + product!.image!,
                brandName: product!.name ?? "",
                offerPrice: "${product?.offerPrice ?? 0.0}",
                disCount: controller.discountAmount.toString(),
                itemQty: controller.quantity.value.toString(),
                subTotalTitle: "",
                subTotalAmout: "",
              ),

              /// View details
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    backgroundColor: Color(0xffF7F9FC),
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    // Allow the bottom sheet to take up more space
                    builder: (BuildContext context) {
                      return ProductsDetails(product: product,);
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 2),
                  alignment: Alignment.center,
                  color: AppColors.whiteColor,
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        right: 8,
                        text: "Details",
                        style: robotoMedium.copyWith(
                            color: AppColors.primaryColor, fontSize: 14.sp),
                      ),
                      Assets.icons.icArrowDown
                          .svg(color: AppColors.primaryColor, height: 16)
                    ],
                  ),
                ),
              ),

              /// =============== Price & Quantity Setup
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 12),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Assets.icons.summery.svg(),
                        CustomText(
                          left: 12,
                          text: 'Price & Quantity Setup',
                          style: robotoSemiBold.copyWith(
                              color: Color(0xff4A72FF), fontSize: 16),
                        )
                      ],
                    ),
                    //// Quantity (Bag)
                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "Quantity (Bag)",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700),
                    ),
                    CustomTextField(
                      controller: controller.quantityText,
                      hintText: '0.0',
                      onChanged: (text) {
                        print(text);
                        controller.updateQuantity(
                            int.parse(text.isEmpty ? "1" : text), product);
                      },
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "";
                        } else if ((int.tryParse(error ?? "1") ?? 1) >
                            (product?.stockQuantity ?? 0).toInt()) {
                          return "Out of stock";
                        }
                        return null;
                      },
                    ),

                    /// -==================   RFT
                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "RFT",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700),
                    ),
                    CustomTextField(
                      controller: controller.rftController,
                      readOnly: true,
                      hintText: '0.0',
                      onChanged: (text) {
                        // controller.rfl.value = int.parse(text);
                      },
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),

                    /// -==================         Weight
                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "Weight",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700),
                    ),
                    CustomTextField(
                      hintText: '0.0',
                      readOnly: true,
                      controller: controller.weightController,
                      onChanged: (text) {
                        // controller.weight.value = int.parse(text);
                      },
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              /// =============== "Discount Amount",
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 12),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Assets.icons.summery.svg(),
                        CustomText(
                          left: 12,
                          text: "Discount Amount",
                          style: robotoSemiBold.copyWith(
                              color: Color(0xff4A72FF), fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: '0.0',
                      onChanged: (text) {
                        controller.updateDiscount(double.parse(text));
                      },
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              BottomCard(
                  subTotal: controller.subtotal.value.toString(),
                  discountA: controller.discountAmount.value.toString(),
                  totalAmount: controller.totalAmount.value.toString(),
                  itemQty: controller.quantity.value.toString(),
                  buttonText: "Add to cart",
                  onTap: () async {
                    // context.pushNamed(Routes.checkoutPage);
                    final cartItem = CartItemModel(
                        product: product,
                        rft: num.tryParse(controller.rftController.text),
                        weight: num.tryParse(controller.weightController.text),
                        subTotal: controller.subtotal.value,
                        discountAmount: controller.discountAmount.value,
                        totalAmount: controller.totalAmount.value,
                        quantity: controller.quantity.value,
                        orderType: controller.orderType.value
                    );

                    controller.addToCart(cartItem, success: () {
                      showModalBottomSheet<void>(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SuccessBottom();
                        },
                      ).timeout(Duration(seconds: 3)).whenComplete(() {
                        if (context.canPop()) {
                          context.pop();
                          context.pop();
                        }
                      });
                    });
                  },
                  isCheckBox: SizedBox())
            ],
          );
        });
      }),
    );
  }
}
