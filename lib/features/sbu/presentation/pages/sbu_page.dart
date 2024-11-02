import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/features/Settings/presentation/controller/Settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/routes/route_path.dart';
import '../../../Main/presentation/controller/Main_controller.dart';

class SbuPage extends StatelessWidget {
  const SbuPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<SettingsController>().getUserProfile();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Select'),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.mainPage);
              },
              icon: Icon(
                Icons.settings,
                color: AppColors.primarySlate700,
              ))
        ],
      ),
      body: GetBuilder<SettingsController>(builder: (controller) {
        return Obx(() {
          return Column(
            children: [
              // controller.userResponse.value!.getData!.sbus!.isEmpty?EmptyWidget():
              controller.isLoading.value
                  ? LoadingWidget()
                  : Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(12),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount:
                            (controller.userResponse.value?.getData?.sbus ?? [])
                                .length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.find<MainController>().selectSbu.value =
                                  (controller
                                          .userResponse.value?.getData?.sbus ??
                                      [])[index];
                              context.pushNamed(Routes.mainPage);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              alignment: Alignment.center,
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/red_circle.png"))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CacheImage(
                                    height: 100,
                                    width: 100,
                                    imageUrl: "",
                                  ),
                                  Text(controller.userResponse.value?.getData
                                          ?.sbus?[index].fullName ??
                                      "")
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
        });
      }),
    );
  }
}
