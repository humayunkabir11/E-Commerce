import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/config/util/dimensions.dart';
import '../../../../core/config/util/style.dart';

import '../../../config/color/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color? borderColor;
  final double titleSize;
  final FontWeight titleWeight;
  final double borderRdius;
  final double buttonHeight;
  final double? buttonWidth;

  final Widget? iconLeft;
  final Widget? iconRight;

  const CustomElevatedButton({
    required this.onPressed,
    required this.titleText,
    this.titleColor = AppColors.whiteColor,
    this.buttonColor =AppColors.primaryColor,
    this.titleSize = 16,
    this.borderRdius = 6,
    this.titleWeight = FontWeight.w500,
    this.buttonHeight = 48,
    this.buttonWidth,
    this.borderColor,
    this.iconLeft,
    this.iconRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: buttonHeight.h,
        width: buttonWidth ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRdius),
           color:buttonColor
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconLeft ?? SizedBox(),
              SizedBox(
                width: 12.w,
              ),
              Text(
                titleText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: robotoSemiBold.copyWith(color: titleColor, fontSize: titleSize, fontWeight: titleWeight
                ),
              ),
              SizedBox(width: 12.w,),
              iconRight ?? SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
}
