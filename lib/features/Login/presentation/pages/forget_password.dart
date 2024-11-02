import 'package:aji/features/Login/presentation/controller/Login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -4,
          title: Text("Forget Password"),
        ),
        body: GetBuilder<LoginController>(builder: (controller) {
          return Obx(() {
            return Form(
              key: controller.forgetFormKey,
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
                      text: "Forget password?",
                      style: robotoSemiBold.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 24
                      ),),

                    CustomText(
                      top: 16,
                      bottom: 8,
                      maxLines: 2,
                      text: "Your user phone number",
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700
                      ),),
                    CustomTextField(
                      hintText: 'Enter user phone number',
                      controller: controller.forgetPhoneController,
                      validator: (error) {
                        if ((error ?? "").isEmpty) {
                          return "Please enter phone number";
                        }
                        return null;
                      },
                    ),

                    CustomText(
                      top: 12,
                      bottom: 16,
                      maxLines: 2,
                      text: "A temporary password will send your email",
                      style: robotoRegular.copyWith(
                          color: AppColors.primarySlate500,
                          fontSize: 12
                      ),),
                    controller.isLoading.value
                        ? LoadingWidget() : CustomElevatedButton(onPressed: () {
                      if (controller.forgetFormKey.currentState!.validate()) {
                        controller.forgetPass(context);
                        // context.pushNamed(Routes.recoveryPassPage);
                      }
                    }, titleText: "Continue"),

                  ],
                ),
              ),
            );
          });
        })
    );
  }
}
