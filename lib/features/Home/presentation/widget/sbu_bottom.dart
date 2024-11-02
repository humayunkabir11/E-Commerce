import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/features/Settings/presentation/controller/Settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class SbuBottom extends StatelessWidget {
  const SbuBottom({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<SettingsController>().getUserProfile();
    });
    return GetBuilder<SettingsController>(builder: (controller) {
      return Obx(() {
        return controller.isLoading.value?
        LoadingWidget():DraggableScrollableSheet(
            initialChildSize: 0.95,
            //set this as you want
            maxChildSize: 0.95,
            //set this as you want
            minChildSize: 0.50,
            //set this as you wan
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        left: 12,
                        text: "Select One", style: robotoSemiBold.copyWith(
                          color: AppColors.primarySlate800,
                          fontSize: 16.sp
                      ),),

                      IconButton(onPressed: () {
                        context.pop();
                      }, icon: Assets.icons.icClose.svg())
                    ],
                  ),
                  controller.isLoading.value
                      ? LoadingWidget()
                      :
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(12),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: controller.userResponse.value?.getData?.sbus
                          ?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            // Get
                            //     .find<MainController>()
                            //     .selectSbu
                            //     .value = controller.userResponse.value!.getData!
                            //     .sbus![index];
                            // context.pushNamed(Routes.mainPage);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            alignment: Alignment.center,
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.primaryColor,

                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CacheImage(
                                  height: 100,
                                  width: 100,
                                  imageUrl: "",
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  textAlign: TextAlign.center,
                                  controller.userResponse.value?.getData
                                      ?.sbus?[index].fullName ?? "",
                                  style: robotoMedium.copyWith(
                                      color: AppColors.primarySlate700
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Image.asset("assets/images/anwer_logo.png")
                ],
              );
            }
        );
      });
    })
    ;
  }
}
