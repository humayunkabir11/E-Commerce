import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/custom_assets/assets.gen.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Settings/presentation/controller/Settings_controller.dart';
import 'edit_address.dart';

class DeliveryInformation extends StatefulWidget {

  final String ? address;
  final Widget ?icons;

  const DeliveryInformation({super.key, this.icons, this.address});

  @override
  State<DeliveryInformation> createState() => _DeliveryInformationState();
}

class _DeliveryInformationState extends State<DeliveryInformation> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () {
      Get.find<SettingsController>().getUserProfile();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<OrderController>(builder: (controller) {
      return controller.isLoading.value?
      LoadingWidget():
      Container(

        color: AppColors.whiteColor,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  bottom: 12,
                  text: 'Address',
                  style: TextStyle(
                    color: Color(0xFFD8A800),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                widget.icons ?? InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )),
                        context: context,
                        builder: (BuildContext context) {
                          return EditAddress(
                            addressType: "address",
                          );
                        },
                      );
                    },
                    child: Assets.icons.icEdit1.svg(color: Color(0xFFD8A800),))
              ],
            ),
            CustomText(
              maxLines: 5,
              text: controller.nameController.text,
              style: TextStyle(
                color: Color(0xFF455468),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            CustomText(
              text:  controller.deliveryAddress.text,
              style: TextStyle(
                color: Color(0xFF5E718D),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Contact Details',
                  style: TextStyle(
                    color: Color(0xFFD8A800),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                widget.icons ?? InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )),
                        context: context,
                        builder: (BuildContext context) {
                          return EditAddress(
                            address: "name",
                            name: controller.nameController.text,
                            phone: controller.phoneController.text,
                            email:  controller.emailController.text,);
                        },
                      );
                    },
                    child: Assets.icons.icEdit1.svg(color: Color(0xFFD8A800),))
              ],
            ),
            const SizedBox(height: 8),
            CustomText(
              text:controller.nameController.text,
              style: TextStyle(
                color: Color(0xFF455468),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            CustomText(
              text: controller.phoneController.text,
              style: TextStyle(
                color: Color(0xFF5E718D),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            CustomText(
              text:controller.emailController.text,
              style: TextStyle(
                color: Color(0xFF5E718D),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    });
  }
}
