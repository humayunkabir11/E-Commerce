import 'package:aji/core/routes/route_path.dart';
import 'package:aji/features/Settings/presentation/widget/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/Appbar/custom_appbar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class ShippingAddressListPage extends StatelessWidget {
  const ShippingAddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Shipping Address",
          style: robotoSemiBold.copyWith(
              color: AppColors.primarySlate700, fontSize: 18),
        ),
        actions: [
          InkWell(
            onTap: () {
              context.pushNamed(Routes.addShippingAddressPage);
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                  Gap(6),
                  Text(
                    "Add More",
                    style: robotoSemiBold.copyWith(
                        fontSize: 16, color: AppColors.primaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return AddressTile(
                onEdit: (){
                  context.pushNamed(Routes.addShippingAddressPage);
                },
                isSelected: index == 0,
                index: index+1,
              );
            }),
      ),
    );
  }
}
