
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
class CartWidget extends StatelessWidget {
  final String ? text;
  final Color ? colorText;
  final VoidCallback ? ontap;
  final Color ? color;
  final Color ? iconColor;

  const CartWidget({super.key,
    this.text,
    this.colorText,
    this.ontap,
    this.color,
    this.iconColor
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color:color?? Color(0xFFFFF4F4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icons.icPlus1.svg(color:iconColor?? AppColors.primaryColor,height: 30),
            SizedBox(height: 12,),
            Text(
             text?? 'Regular Order',
              style: TextStyle(
                color: colorText??Color(0xFFE82C4C),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
