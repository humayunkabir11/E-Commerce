import 'dart:io';

import 'package:aji/core/common/widgets/card/bottom_card.dart';
import 'package:aji/core/common/widgets/card/product_cart.dart';
import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/core/config/util/text_style.dart';
import 'package:aji/core/custom_assets/assets.gen.dart';
import 'package:aji/features/cart/presentation/controller/cart_controller.dart';
import 'package:aji/features/More/data/models/user_profile_model.dart';
import 'package:aji/features/Settings/presentation/controller/Settings_controller.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:aji/features/order/presentation/widget/dotted_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/config/util/dimensions.dart';
import '../../../../core/routes/route_path.dart';
import '../../data/models/ware_house_model.dart';
import '../widget/delivery_information.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  late CartController cartController;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      Get.find<OrderController>().getWareHouse();
    });

    cartController = Get.find<CartController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Place Your Orders (${cartController.cartList.length})'),
      ),
      body: GetBuilder<OrderController>(builder: (controller) {
        final cartList = cartController.cartList;
        controller.cashAmountText.text = cartController.totalAmount.toString();

        return Obx(() {
          return ListView(
            children: [
              Column(
                children: List.generate(
                    cartList.length,
                    (index) => ProductCart(
                          brandName: cartList[index].product?.name,
                          offerPrice:
                              "${cartList[index].product?.offerPrice ?? 0}",
                          productImage: cartList[index].product?.image,
                          disCount: "${cartList[index].discountAmount ?? 0}",
                          itemQty: "${cartList[index].quantity ?? 0}x",
                          subTotalTitle: "",
                          subTotalAmout: "",
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
              ),

              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 12),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.isLoading.value
                        ? LoadingWidget()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                top: 12.h,
                                bottom: 8,
                                text: "Select Warehouse".tr,
                                style: robotoMedium.copyWith(
                                  color: AppColors.primarySlate700,
                                  fontSize:
                                      Dimensions.getFontSizeLarge(context),
                                ),
                              ),
                              Container(
                                width: 1.0.sw,
                                height: 60,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.r, vertical: 4.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border: Border.all(
                                      color: AppColors.primarySlate300),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButton(
                                          underline: SizedBox(),
                                          hint: Text(
                                            "Select warehouse".tr,
                                            style: robotoMedium.copyWith(
                                                color:
                                                    AppColors.primarySlate400,
                                                fontSize: 14.sp),
                                          ),
                                          value: controller.warehouse.value,
                                          isExpanded: true,
                                          items: controller
                                              .wareResponse.value!.warehouses!
                                              .map<DropdownMenuItem<Warehouse>>(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e.name ?? ""),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (value) {
                                            controller.warehouse.value = value;
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 12,
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.payment_outlined,
                          color: Color(0xff4A72FF),
                        ),
                        CustomText(
                          left: 12,
                          text: 'Payment Method',
                          style: robotoSemiBold.copyWith(
                              color: Color(0xff4A72FF), fontSize: 16),
                        )
                      ],
                    ),

                    /// ==================== check box
                    Row(
                      children: List.generate(3, (index) {
                        return Center(
                          child: Row(
                            children: <Widget>[
                              Obx(() {
                                return Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    side: BorderSide(
                                        width: 1,
                                        color: AppColors.primarySlate300),
                                    shape: CircleBorder(),
                                    value:
                                        controller.selectedIndex.value == index,
                                    // Select only the checkbox at the selected index
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (bool? value) {
                                      // Update the selected index when checkbox is clicked
                                      if (value == true) {
                                        controller.updateSelectedIndex(index);
                                        print(controller.selectedIndex.value);
                                      }
                                    },
                                  ),
                                );
                              }),
                              CustomText(
                                text: controller.payCate[index],
                                // Customize the label for each checkbox if needed
                                style: robotoMedium.copyWith(
                                  color: AppColors.primarySlate600,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),

                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "Cash Amount",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700),
                    ),
                    CustomTextField(
                      controller: controller.cashAmountText,
                      hintText: '0.0',
                      readOnly: controller.selectedIndex.value == 1,
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),

                    CustomText(
                      top: 16,
                      bottom: 8,
                      text: "Deposit Slip",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700),
                    ),

                    Row(
                      children: [
                        DottedCard(
                          onTap: () {
                            controller.pickFile(
                                type: "camera", fileType: "image");
                          },
                          text: "Take Photo",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        DottedCard(
                          onTap: () {
                            controller.pickFile(
                                type: "gallery", fileType: "image");
                            // controller.pickedDate(context);
                          },
                          text: "Browse File",
                          icons: Assets.icons.icPlus1
                              .svg(color: AppColors.primarySlate400),
                        ),
                      ],
                    ),

                    /// ======================= pick image
                    controller.photoUploading.value
                        ? LoadingWidget()
                        : controller.pickImage.value.isNotEmpty
                            ? Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 12),
                                width: 110,
                                // Customize the width
                                height: 140,
                                // Customize the height
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  // Apply border radius
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.pickImage.value),
                                    // Load the image
                                    fit: BoxFit
                                        .cover, // Adjust how the image is fitted
                                  ),
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      controller.pickImage.value = "";
                                    },
                                    child:
                                        Image.asset("assets/images/close.png")),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.all(12),
                                width: 110,
                                // Customize the size
                                height: 140,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: CustomText(
                                  textAlign: TextAlign.center,
                                  text: "Deposit Slip",
                                  maxLines: 2,
                                  style: robotoSemiBold.copyWith(
                                      color: Color(0xffD6D6D6), fontSize: 18),
                                )),

                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "Credit Amount",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700),
                    ),

                    CustomTextField(
                      hintText: '0.0',
                      readOnly: controller.selectedIndex.value == 0,
                      controller: controller.creditAmountText,
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "";
                        }
                        return null;
                      },
                    ),

                    /// ============= date pick
                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "Date of Honor",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700),
                    ),
                    CustomTextField(
                      hintText: 'DD/MM/YYYY',
                      readOnly: true,
                      controller: TextEditingController(
                          text: controller.selectedDate.value),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.pickedDate(context);
                        },
                        child: SizedBox(
                          width: 40,
                          child: Row(
                            children: [
                              Text(
                                "| ",
                                style: semiBoldText(
                                    color: AppColors.primarySlate200, 20),
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: AppColors.primarySlate300,
                              ),
                            ],
                          ),
                        ),
                      ),
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "";
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),

                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        DottedCard(
                          onTap: () {
                            controller.pickFile(
                                type: "camera", fileType: "cheque");
                          },
                          text: "Take Photo",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        DottedCard(
                          onTap: () {
                            controller.pickFile(
                                type: "gallery", fileType: "cheque");
                          },
                          text: "Browse File",
                          icons: Assets.icons.icPlus1
                              .svg(color: AppColors.primarySlate400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),

                    /// ==================== pick cheque ================== ///
                    controller.photoUploading.value
                        ? LoadingWidget()
                        : controller.pickCheque.value.isNotEmpty
                            ? Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 12),
                                width: double.infinity,
                                // Customize the width
                                height: 140,
                                // Customize the height
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  // Apply border radius
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.pickCheque.value),
                                    // Load the image
                                    fit: BoxFit
                                        .cover, // Adjust how the image is fitted
                                  ),
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      controller.pickCheque.value = "";
                                    },
                                    child:
                                        Image.asset("assets/images/close.png")),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 12),
                                padding: EdgeInsets.all(12),
                                width: double.infinity,
                                // Customize the size
                                height: 140,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: CustomText(
                                  textAlign: TextAlign.center,
                                  text: "check",
                                  maxLines: 2,
                                  style: robotoSemiBold.copyWith(
                                      color: Color(0xffD6D6D6), fontSize: 18),
                                )),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              /// ====================== Delivery Info
              Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Assets.icons.truck.svg(),
                    CustomText(
                      left: 12,
                      text: "Delivery Information",
                      style: robotoSemiBold.copyWith(
                          color: Color(0xff4A72FF), fontSize: 18.sp),
                    )
                  ],
                ),
              ),
              DeliveryInformation(),
              SizedBox(
                height: 8,
              ),
              BottomCard(
                subTotal: cartController.subTotal.toString(),
                discountA: cartController.totalDiscount.toString(),
                totalAmount: cartController.totalAmount.toString(),
                itemQty: cartController.totalQuantity.toInt().toString(),
                buttonText: "Proceed to Checkout",
                onTap: () {
                  context.pushNamed(Routes.checkoutPage);
                },
                isCheckBox: SizedBox(),
                summary: SizedBox(),
              )
            ],
          );
        });
      }),
    );
  }
}
