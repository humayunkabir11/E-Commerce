import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/features/Login/presentation/controller/Login_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -4,
          title: Text("Recovery Password"),
        ),
        body: GetBuilder<LoginController>(builder: (controller) {
          return Obx(() {
            return Form(
              key: controller.recoverFormKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.images.loginLogo.image(),
                    CustomText(
                      maxLines: 2,
                      top: 24,
                      text: "Recovery password?",
                      style: robotoSemiBold.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 24
                      ),),


                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "OTP",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700
                      ),),
                    CustomTextField(
                      hintText: 'Enter OTP',
                      controller: controller.otpController,
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "Please enter OTP";
                        }
                        return null;
                      },
                    ),

                    Gap(16),
                    CustomTextField(
                      controller: controller.newPasswordController1,
                      hintText: "New Password",
                      label: "New Password",
                      isPassword: true,
                      fieldBorderColor: Color(0xffAFBACA),
                      //textEditingController: controller.passwordController,
                      icon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Assets.icons.icPassword.svg(),
                      ),
                      // icon: Icon(Icons.lock, color: AppColors.primarySlate500,),
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      isPrefixIcon: true,
                    ),
                    Gap(16),


               controller.getOtpLoading.value?LoadingWidget():CustomElevatedButton(onPressed: () {
                      if (controller.recoverFormKey.currentState!.validate()) {
                        controller.getOtp(context);
                      }
                    }, titleText: "Save"),

                  ],
                ),
              ),
            );
          });
        })
    );
  }
}
