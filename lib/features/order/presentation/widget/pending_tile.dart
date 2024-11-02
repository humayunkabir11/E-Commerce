import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class PendingTile extends StatelessWidget {
  const PendingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 0, vertical: 6),

      //---------------------------------------icon
      leading: Container(
        height: 56,
        width: 56,
        padding: EdgeInsets.all(4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color(0xFFFFF5F4)),
        child: SvgPicture.asset(
            'assets/icons/ic_shopping_cart.svg'),
      ),

      //---------------------------------------product name
      title: Text(
        "Anwar Cement",
        style: robotoMedium.copyWith(
            fontSize: 18,
            letterSpacing: -0.3,
            color: AppColors.primarySlate800),
      ),

      //---------------------------------------status
      subtitle: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_checks.svg'),
          Gap(6),
          Text(
            "Order Placed",
            style: robotoMedium.copyWith(
                fontSize: 16, color: AppColors.warning500),
          )
        ],
      ),

      //---------------------------------------price and price status
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '510,000 BDT',
            style: robotoSemiBold.copyWith(
                fontSize: 16,
                color: AppColors.primarySlate800),
          ),

          //-----------------------------------------payment status
          Text(
            'Cash',
            style: robotoSemiBold.copyWith(
                fontSize: 16, color: Colors.green[500]),
          )
        ],
      ),
    );
  }
}
