import 'package:aji/core/common/widgets/text%20field/text_field.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/core/custom_assets/assets.gen.dart';
import 'package:aji/features/Login/presentation/controller/Login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/routes/route_path.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller) {
        return Form(
          key: controller.loginFormKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.images.loginLogo.image(),
                CustomText(
                  maxLines: 2,
                  text: "Login to Connect, Explore,and Achieve",
                  style: robotoSemiBold.copyWith(
                      color: AppColors.primaryColor, fontSize: 24),
                ),
                CustomText(
                  top: 16,
                  bottom: 8,
                  maxLines: 2,
                  text: "Your Phone Number",
                  style:
                      robotoMedium.copyWith(color: AppColors.primarySlate700),
                ),
                CustomTextField(
                  hintText: 'Enter Phone Number',
                  controller: controller.phoneController,
                  validator: (error) {
                    if ((error ?? "").isEmpty) {
                      return "Please enter your phone number";
                    }
                    return null;
                  },
                ),
                CustomText(
                  top: 12,
                  bottom: 8,
                  maxLines: 2,
                  text: "Your password",
                  style:
                      robotoMedium.copyWith(color: AppColors.primarySlate700),
                ),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Password",
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
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.forgetPassPage);
                  },
                  child: CustomText(
                    top: 24,
                    bottom: 16,
                    text: "Forget password?",
                    style: robotoMedium.copyWith(color: Color(0xff1B4DFF)),
                  ),
                ),
                Obx(() => controller.loginLoading
                    ? LoadingWidget()
                    : CustomElevatedButton(
                        onPressed: () {
                          if (controller.loginFormKey.currentState!
                              .validate()) {
                            // context.pushNamed(Routes.mainPage);
                            controller.loginUser(context);
                          }
                        },
                        titleText: "Login")),
              ],
            ),
          ),
        );
      }),
    );
  }
}
