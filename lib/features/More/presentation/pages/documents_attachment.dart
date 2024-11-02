import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/color/app_colors.dart';

class DocumentsAttachment extends StatelessWidget {
  const DocumentsAttachment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document Attachments"),
      ),

      body: ListView(
        children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 12),
        child: Column(
          children: [
            _customRow(
              title: "Agreement Paper:",
              onTap: (){

              }
            ),

            _customRow(
                title: "Trade License:",
                onTap: (){

                }
            ),

            _customRow(
                title: "TIN Certificate:",
                onTap: (){

                }
            ),

            _customRow(
                title: "eTIN Return:",
                onTap: (){

                }
            ),


            _customRow(
                title: "Bank Statement:",
                onTap: (){

                }
            ),

          ],
        ),
      )
        ],
      ),
    );
  }
}


Widget _customRow({String? title, VoidCallback? onTap,Widget?isDivider}){
  return Column(
    children: [
      ListTile(
        onTap:onTap,
        title: CustomText(
          text: title?? ' ',
          style: TextStyle(
            color: Color(0xFF455468),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            alignment: Alignment.center,
            height: 64.h,
            width: 52.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/pdf.png"))
            ),
            child: SvgPicture.asset("assets/images/eye.svg") ,
          ),
        ),

      ),
      isDivider??  Divider(height: 0,color: AppColors.primarySlate50,)
    ],
  );
}