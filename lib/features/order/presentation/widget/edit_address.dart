import 'package:aji/core/common/widgets/Button/elevated_button.dart';
import 'package:aji/core/common/widgets/text%20field/text_field.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Settings/presentation/controller/Settings_controller.dart';

class EditAddress extends StatefulWidget {

  final String ? addressType;
  final String ? address;
  final String ? name;
  final String ? phone;
  final String ? email;

  const EditAddress({super.key,
    this.addressType,
    this.address,
    this.name,
    this.phone,
    this.email});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return widget.addressType=="address"?
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
             children: [
            CustomText(text: "Address",bottom: 12,textAlign: TextAlign.start,),

             CustomTextField(
                controller: controller.deliveryAddress,
                hintText: "Address"
            ),

            SizedBox(height: 24),
            CustomElevatedButton(
                onPressed: () {

                  Get.find<SettingsController>().updateDeliveryAddress(address: controller.deliveryAddress.text);
                  context.pop();


                },

                titleText: "Save"
            )
          ],
        ),
      ):


      ListView(
        padding: const EdgeInsets.all(12.0),
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [

          CustomText(text: "Name",bottom: 8,top: 12,),
          CustomTextField(
              controller: controller.nameController,
              hintText: "Name"
          ),


          CustomText(text: "Phone",bottom: 8,top: 12,),
          CustomTextField(
              controller: controller.phoneController,
              hintText: "Phone"
          ),



          CustomText(text: "Email",bottom: 8,top: 12,),
          CustomTextField(
              controller: controller.emailController,
              hintText: "Email"
          ),
          SizedBox(height: 24),
          CustomElevatedButton(
              onPressed: () {
               // Get.find<SettingsController>().updateDeliveryAddress1(phone:controller.phoneController.text);
                context.pop();
              },
              titleText: "Save"
          )
        ],
      );
    });
  }
}
