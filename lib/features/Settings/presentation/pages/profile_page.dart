import 'package:aji/core/common/widgets/image/cache_image.dart';
import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/features/Settings/presentation/controller/Settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/Appbar/custom_appbar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      Get.find<SettingsController>().getUserProfile();
    });
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "User Profile",
          style: robotoSemiBold.copyWith(
              color: AppColors.primarySlate700, fontSize: 18),
        ),
      ),
      body: GetBuilder<SettingsController>(builder: (controller) {
        return Obx(() {
          return controller.isLoading.value?
          LoadingWidget(): SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(top: 12),
                  width: double.maxFinite,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //-----------------------profile image
                      CacheImage(
                        imageUrl: "",
                        width: 100,
                        height: 100,
                        borderRadius: 100,
                      ),

                      Gap(16),
                      Text(
                       controller.userResponse.value!.getData!.organizationName?? "",
                        style: robotoSemiBold.copyWith(
                            fontSize: 18, color: AppColors.primarySlate600),
                      ),


                      Gap(8),
                      SizedBox(
                        width: 0.6.sw,
                        child: Text(
                          controller.userResponse.value!.getData!.address??"",
                          textAlign: TextAlign.center,
                          style: robotoMedium.copyWith(
                              fontSize: 14,
                              letterSpacing: -0.2,
                              color: AppColors.primarySlate500),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 12),
                  child: Column(
                    children: [

                    Gap(8),
                    SizedBox(
                      width: 0.6.sw,
                      child: Text(
                        controller.userResponse.value!.getData!.address??"",
                        textAlign: TextAlign.center,
                        style: robotoMedium.copyWith(
                            fontSize: 14,
                            letterSpacing: -0.2,
                            color: AppColors.primarySlate500),
                      ),
                    ),
                  ],
                ),
              ),*/
              Container(
                width: double.maxFinite,
                color: Colors.white,
                margin: EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    _userInfo(
                        key: "User Email: ",
                        value:  controller.userResponse.value!.getData!.email??""
                    ),

                      _userInfo(
                          key: "Contact Number:",
                          value: controller.userResponse.value!.getData!.phoneNumber?? ""
                      ),

                      _userInfo(
                          key: "Last Login",
                          value:  controller.userResponse.value!.getData!.createdAt!.toLocal().toString()??""
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
      }),
    );
  }

  Widget _userInfo({required String key, required String value}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.primarySlate50, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: robotoMedium.copyWith(
                color: AppColors.primarySlate600, fontSize: 16),
          ),
          Text(
            value,
            style: robotoRegular.copyWith(
                color: AppColors.primarySlate500,
                fontSize: 14,
                letterSpacing: -0.2),
          )
        ],
      ),
    );
  }
}
