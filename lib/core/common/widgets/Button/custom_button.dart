import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/util/style.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;

  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? textColor;
  final double? textSize;
  final VoidCallback? onTap;
  final Widget ? child;
  CustomButton(
      {this.title,
      this.color,
      this.textColor,
      this.onTap,
      this.height,
      this.width,
      this.borderRadius,
      this.textSize,
        this.child, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 36.w,
        height: height ?? 36.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius??8),
            gradient: LinearGradient(
              colors: [
                Color(0xffFFB199),
               Color(0xffFF0844)
              ],
              begin:  Alignment.topRight,
              end: Alignment.topLeft,
            ),

          ),
        child: Center(
          child: child ??  Text(title ?? 'text',
                  style: robotoMedium.copyWith(
                      fontSize: textSize ?? 16,
                      color: textColor),
                  textScaler: TextScaler.linear(1.0)),
        ),
      ),
    );
  }
}
