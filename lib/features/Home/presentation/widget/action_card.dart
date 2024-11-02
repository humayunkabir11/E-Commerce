import 'package:aji/features/Home/data/models/action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/config/util/style.dart';

class ActionCard extends StatelessWidget {
  final ActionModel action;
  final void Function()? onTap;

  const ActionCard({super.key, required this.action, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: Container(
        width: 110.w,
        height: 110.h,
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,

        decoration: BoxDecoration(
            color: action.color.withOpacity(0.10),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1,
                color: action.color.withOpacity(0.25)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(action.iconSrc),

            Text(action.label, style: robotoMedium.copyWith(
                fontSize: 16,
                color: action.color
            ),)
          ],
        ),
      ),
    );
  }
}
