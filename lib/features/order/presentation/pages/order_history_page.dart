import 'package:aji/core/common/widgets/card/date_range_picker.dart';
import 'package:aji/core/common/widgets/card/info_card.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:aji/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.find<OrderController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Orders History",
          style: robotoMedium.copyWith(
            fontSize: 18,
            color: AppColors.primarySlate800,
          ),
        ),

        actions: [
          Transform.scale(
            scaleX: 0.9,
              child: DateRangePicker()),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 56,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: AppColors.primarySlate100))),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.status.length,
                itemBuilder: (context, index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          controller.updateSelectedStatus(index);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: controller.selectedStatus == index
                                  ? AppColors.error25
                                  : AppColors.primarySlate25,
                              border: Border.all(
                                  color: controller.selectedStatus == index
                                      ? AppColors.primaryColor
                                      : AppColors.primarySlate100)),
                          child: Text(
                            controller.status[index],
                            style: robotoMedium.copyWith(
                                fontSize: 16,
                                color: controller.selectedStatus == index
                                    ? AppColors.primaryColor
                                    : AppColors.primarySlate500),
                          ),
                        ),
                      ));
                }),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return InfoCard(
                iconSrc: 'iconSrc',
                isWaiting: index % 2 == 0,
              );
            }),
          ),
        ],
      ),
    );
  }
}
