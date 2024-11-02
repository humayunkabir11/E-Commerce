import 'package:aji/core/common/widgets/card/action_tile.dart';
import 'package:aji/core/common/widgets/image/cache_image.dart';
import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/core/routes/route_path.dart';
import 'package:aji/features/Home/data/models/action_model.dart';
import 'package:aji/features/Home/presentation/controller/Home_controller.dart';
import 'package:aji/features/Home/presentation/widget/action_card.dart';
import 'package:aji/features/Home/presentation/widget/carousel_slider.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../cart/presentation/widget/new_order_bottom.dart';
import '../../../order/presentation/widget/success_bottom.dart';
import '../widget/sbu_bottom.dart';
import '../widget/target_achievement_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    Future.delayed(Duration.zero, () {
      controller.getSliderData();
    });

    return Scaffold(
      body: Column(
        children: [
          //---------------------------------------------custom appbar
          SafeArea(
            child: Container(
              color: Colors.white,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                //-------------------------------------profile image
                leading: ClipOval(
                    child: CacheImage(
                  imageUrl: '',
                  height: 40,
                  width: 40,
                )),
                title: Text(
                  'Welcome!',
                  style: robotoSemiBold.copyWith(
                      color: AppColors.primarySlate700, fontSize: 18),
                ),

                //-------------------------------------------user name
                subtitle: Row(
                  children: [
                    Text(
                      'Md Abdur Rouf',
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate500,
                          fontSize: 14,
                          letterSpacing: -0.2),
                    ),
                    SizedBox(
                      width: 44.w,
                      height: 24.h,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              backgroundColor: Color(0xffF7F9FC),
                              context: context,
                              useSafeArea: true,
                              isScrollControlled:
                                  true, // Allow the bottom sheet to take up more space
                              builder: (BuildContext context) {
                                return SbuBottom();
                              },
                            );
                          },
                          child: SvgPicture.asset(
                              "assets/icons/CaretCircleDown.svg")),
                    )
                  ],
                ),

                //-------------------------------------------notification
                trailing: IconButton(
                    onPressed: () {
                      context.pushNamed(Routes.notificationPage);
                    },
                    icon: SvgPicture.asset('assets/icons/ic_notification.svg')),
              ),
            ),
          ),

          //---------------------------------------------body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() => controller.sliderLoading.value
                      ? LoadingWidget()
                      : controller.sliderList.isNotEmpty
                          ? CarouselSlider(
                              sliderList: controller.sliderList,
                            )
                          : SizedBox()),
                  SizedBox(height: 370, child: TargetAchievementCard()),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      children: [
                        //--------------------------------actions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              3,
                              (index) => ActionCard(
                                  onTap: () {
                                    if (index == 0) {
                                      //--------------------------------------orders
                                      showModalBottomSheet<void>(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        )),
                                        context: context,
                                        builder: (BuildContext context) {
                                          return NewOrderBottom(
                                            onSimpleOrder: () {
                                              context.pushNamed(Routes.orderPage);
                                              Get.find<OrderController>().orderType.value="Sample";
                                            },
                                            onRegularOrder: () {
                                              context.pushNamed(Routes.orderPage);
                                              Get.find<OrderController>().orderType.value="Regular";
                                            },
                                          );
                                        },
                                      );
                                    } else if (index == 1) {
                                    } else if (index == 2) {
                                      context.pushNamed(Routes.paymentPage);
                                    }
                                  },
                                  action: actions[index])),
                        ),

                        Gap(12),

                        ActionTile(
                            onTap: () {
                              context.pushNamed(Routes.pendingOrders);
                            },
                            iconSrc: 'assets/icons/ic_shipping_bag.svg',
                            label: 'Pending Orders (3)'),

                        ActionTile(
                            onTap: () {
                              context.pushNamed(Routes.orderHistoryPage);
                            },
                            iconSrc: 'assets/icons/ic_clock.svg',
                            label: 'Order History'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
