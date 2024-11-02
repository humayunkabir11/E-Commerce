import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
class DottedCard extends StatelessWidget {

  final Widget ? icons;
  final String ? text;
  final VoidCallback ? onTap;
  const DottedCard({super.key, this.icons, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(6),

          color: AppColors.primarySlate300,
          dashPattern: [5,6],
          child:Container(
            color: Color(0xffF9FAFB),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
               icons?? Icon(Icons.camera_alt_outlined,color: AppColors.primarySlate400,),
                CustomText(
                  left: 6,
                  text: text??"Take Photo",style: robotoRegular.copyWith(
                    color: AppColors.primarySlate400,
                    fontSize: 16
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
