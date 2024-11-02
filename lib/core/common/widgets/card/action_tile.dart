import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';

class ActionTile extends StatelessWidget {
  final String iconSrc;
  final String label;
  final void Function()? onTap;

  const ActionTile(
      {super.key, required this.iconSrc, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(iconSrc),
        title: Text(
          label,
          style: robotoMedium.copyWith(
              fontSize: 16, color: AppColors.primarySlate600),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.primarySlate400,
          size: 16,
        ),
      ),
    );
  }
}
