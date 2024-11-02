import 'package:aji/features/cart/presentation/widget/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class SuccessBottom extends StatelessWidget {
  const SuccessBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
              border: Border.all(
                width: 8,
                color: Color(0xFFFEE6EA)
              )
            ),

            child: SvgPicture.asset('assets/icons/ic_done.svg'),
          ),
        CustomText(
          top: 24.h,
          text: "Successfully Done!",style: robotoSemiBold.copyWith(
          color: AppColors.primaryColor,
          fontSize: 18.sp
        ),)


        ],
      ),
    );
  }
}
