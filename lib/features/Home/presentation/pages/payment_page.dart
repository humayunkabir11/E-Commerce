import 'dart:io';

import 'package:aji/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:aji/core/common/widgets/Button/elevated_button.dart';
import 'package:aji/core/common/widgets/text%20field/text_field.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/features/Home/presentation/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../order/presentation/widget/dotted_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController();

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Payment",
          style: robotoSemiBold.copyWith(
              fontSize: 18,
              color: AppColors.primarySlate700,
              letterSpacing: -0.2),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: "Amount",
                hintText: "0.00",
                keyboardType: TextInputType.number,
              ),

              CustomText(
                top: 16,
                bottom: 8,
                text: "Deposit Slip",
                style: robotoMedium.copyWith(color: AppColors.primarySlate700),
              ),

              Row(
                children: [
                  DottedCard(
                    onTap: () {
                      controller.captureImage();
                    },
                    text: "Take Photo",
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  DottedCard(
                    onTap: () {
                      // controller.pickedDate(context);
                    },
                    text: "Browse File",
                    icons: Assets.icons.icPlus1
                        .svg(color: AppColors.primarySlate400),
                  ),
                ],
              ),

              /// pick image
              Obx(() => controller.pickImage.value.isNotEmpty
                  ? Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 12),
                      width: double.infinity,
                      // Customize the width
                      height: 153,
                      // Customize the height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        // Apply border radius
                        image: DecorationImage(
                          image: FileImage(File(controller.pickImage.value)),
                          // Load the image
                          fit: BoxFit.cover, // Adjust how the image is fitted
                        ),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            controller.pickImage.value = "";
                          },
                          child: Image.asset("assets/images/close.png")),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 12),
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      // Customize the size
                      height: 153,
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
                      ))),

              Gap(16),
              CustomTextField(
                label: "Remarks",
                maxLines: 4,
                hintText: "Text..",
              ),

              Gap(16),
              CustomElevatedButton(onPressed: () {}, titleText: "Submit")
            ],
          ),
        ),
      ),
    );
  }
}
