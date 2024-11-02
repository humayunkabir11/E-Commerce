import 'package:aji/core/common/widgets/Button/elevated_button.dart';
import 'package:aji/core/common/widgets/text%20field/text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/Appbar/custom_appbar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class AddShippingAddressPage extends StatelessWidget {
  const AddShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Shipping Address",
          style: robotoSemiBold.copyWith(
              color: AppColors.primarySlate700, fontSize: 18),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 12),
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                label: "Contact Name",
                hintText: "Contact Name",
              ),
              Gap(16),

              CustomTextField(
                label: "District",
                hintText: "District",
              ),
              Gap(16),
          
              CustomTextField(
                label: "Police Station",
                hintText: "Police Station",
              ),
              Gap(16),
          
              CustomTextField(
                label: "Address",
                hintText: "Address",
              ),
              Gap(16),
          
              CustomTextField(
                label: "Contact Number",
                hintText: "Contact Number",
              ),
              Gap(16),
          
              CustomTextField(
                label: "Remarks",
                hintText: "Remarks",
                maxLines: 4,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              Gap(16),
          
              CustomElevatedButton(onPressed: (){}, titleText: "Save")
            ],
          ),
        ),
      ),
    );
  }
}
