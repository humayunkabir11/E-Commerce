import 'package:aji/core/common/widgets/Button/elevated_button.dart';
import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/features/Settings/presentation/controller/Settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/Appbar/custom_appbar.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../order/presentation/widget/success_bottom.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find<SettingsController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Password Change",
          style: robotoSemiBold.copyWith(
              color: AppColors.primarySlate700, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 12),
          color: Colors.white,
          child: Column(
            children: [
              CustomTextField(
                controller: controller.currentPassword,
                hintText: "Current Password",
                label: "Current Password",
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
              CustomTextField(
                controller: controller.newPassword,
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
              CustomTextField(
                controller: controller.confirmPassword,
                hintText: "Confirm new Password",
                label: "Confirm new Password",
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
              Gap(46),
              Obx(() => controller.passwordLoading
                  ? LoadingWidget()
                  : CustomElevatedButton(
                      onPressed: () {
                        controller.changePassword(() {
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
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          });
                        });
                      },
                      titleText: "Save"))
            ],
          ),
        ),
      ),
    );
  }
}
