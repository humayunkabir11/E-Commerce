import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class CategoryTile extends StatelessWidget {
  final bool isSelected;
  final String text;
  final void Function()? onTap;

  const CategoryTile({
    super.key,
    this.isSelected = false,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: isSelected ? AppColors.error25 : AppColors.primarySlate25,
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.primarySlate100,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Makes sure the Row takes minimum space
          children: [
            if (isSelected)
              SvgPicture.asset(
                'assets/icons/ic_checks.svg',
                colorFilter:
                ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              ),
            if (isSelected) Gap(6),
            Text(
              text,
              style: robotoMedium.copyWith(
                fontSize: 14,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primarySlate500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
