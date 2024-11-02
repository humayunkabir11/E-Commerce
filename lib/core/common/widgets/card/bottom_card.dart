import 'package:aji/core/common/widgets/Button/elevated_button.dart';
import 'package:aji/core/common/widgets/card/product_cart.dart';
import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/core/config/util/text_style.dart';
import 'package:aji/core/routes/route_path.dart';
import 'package:aji/features/cart/presentation/widget/new_order_bottom.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';

class BottomCard extends StatelessWidget {

  final VoidCallback ? onTap;
  final String ? subTotal;
  final String ? discountA;
  final String ? totalAmount;
  final String ? itemQty;
  final Color ? color;
  final String ? deliveryCharge;
  final String ? buttonText;


  final Widget ? isCheckBox ;
  final Widget ? summary ;


  const BottomCard(
      {super.key, this.onTap, this.subTotal, this.discountA, this.totalAmount, this.itemQty, this.color,
        this.deliveryCharge, this.buttonText,
        this.isCheckBox, this.summary
      });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      assignId: true,
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(12),

          color: Colors.white,
          child: Column(
            children: [
              summary??  Row(
                children: [
                  Assets.icons.summery.svg(),
                  CustomText(
                    left: 12,
                    text: "Summery",
                    style: robotoSemiBold.copyWith(
                        color: Color(0xff4A72FF),
                        fontSize: 16
                    ),
                  )

                ],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Subtotal (BDT) :", style: robotoMedium.copyWith(
                      color: AppColors.primarySlate500,
                      fontSize: 16.sp
                  ),),
                  CustomText(
                    text: subTotal ?? "", style: robotoSemiBold.copyWith(
                      color: AppColors.primarySlate600,
                      fontSize: 16.sp
                  ),),
                ],
              ),
              deliveryCharge == null ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Discount Amount (BDT) :",
                    style: robotoMedium.copyWith(
                        color: AppColors.primarySlate500,
                        fontSize: 16.sp
                    ),),
                  CustomText(
                    text: discountA ?? "", style: robotoSemiBold.copyWith(
                      color: AppColors.primarySlate600,
                      fontSize: 16.sp
                  ),),
                ],
              ) : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Delivery Charge (BDT):",
                    style: robotoMedium.copyWith(
                        color: AppColors.primarySlate500,
                        fontSize: 16.sp
                    ),),
                  CustomText(
                    text: discountA ?? "", style: robotoSemiBold.copyWith(
                      color: AppColors.primarySlate600,
                      fontSize: 16.sp
                  ),),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Total Amount :", style: robotoMedium.copyWith(
                      color: AppColors.primarySlate500,
                      fontSize: 16.sp
                  ),),
                  CustomText(
                    text: totalAmount ?? "", style: robotoSemiBold.copyWith(
                      color: AppColors.primarySlate600,
                      fontSize: 16.sp
                  ),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Item Qty :", style: robotoMedium.copyWith(
                      color: AppColors.primarySlate500,
                      fontSize: 16.sp
                  ),),
                  CustomText(
                    text: itemQty ?? "", style: robotoSemiBold.copyWith(
                      color: AppColors.primarySlate600,
                      fontSize: 16.sp
                  ),),
                ],
              ),

              SizedBox(height: 12,),


              isCheckBox??Column(
                children: [
                  FittedBox(
                      child: Text(
                        "----------------------------------------------------------------",
                        style: mediumText(16, color: Color(0xffFFC5C1)),)),


                  Row(
                    children: [
                      Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                  color: AppColors.primarySlate300,
                                  width: 1
                              )
                          ),
                          activeColor: AppColors.primaryColor,
                          value: controller.check.value, onChanged: (v) {
                        controller.selectCheck(v);
                      }),
                      FittedBox(
                          child: CustomText(text: "I agree to the terms and conditions.",style: robotoRegular.copyWith(
                              color: AppColors.primarySlate700,
                              fontSize: 16.sp
                          ),))
                    ],
                  ),
                ],
              ),


              isCheckBox == null?controller.check.value?CustomElevatedButton(
                  onPressed: onTap ?? () {

                  }, titleText: buttonText ?? ""): CustomElevatedButton(
                  buttonColor: AppColors.primarySlate100,
                  titleColor: AppColors.primarySlate300,
                  onPressed: onTap ?? () {

                  }, titleText: buttonText ?? ""): CustomElevatedButton(
                  onPressed: onTap ?? () {
                  }, titleText: buttonText ?? "")



            ],
          ),
        );
      },
    );
  }
}
