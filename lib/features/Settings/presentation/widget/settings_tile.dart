import 'package:flutter/material.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class SettingsTile extends StatelessWidget {
  final bool showLine;
  final String text;
  final void Function()? onTap;

  const SettingsTile(
      {super.key, this.showLine = true, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border(
                bottom: showLine
                    ? BorderSide(width: 1, color: AppColors.primarySlate50)
                    : BorderSide.none)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: robotoMedium.copyWith(
                  fontSize: 16, color: AppColors.primarySlate600),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryError400,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
