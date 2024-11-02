
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/core/custom_assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Details'),

      ),
  body: ListView(
    children: [
      /// =================  BankDetails
       Container(
         margin: EdgeInsets.only(top: 16,
         bottom: 12),
         color: Colors.white,
         padding: EdgeInsets.only(top: 12,bottom: 16),
         child: Column(
           children: [
             _customRow(
               title: "Bank Name:",
               trailing: "Janata Bank PLC"
             ),

             _customRow(
                 title: "Account Title:",
                 trailing: "SM/S Monir Auto Engineering"
             ),

             _customRow(
                 title: "Account No.",
                 trailing: "124 3635 765 27622"
             ),

             _customRow(
                 title: "Branch:",
                 trailing: "Mirpur"
             ),

             _customRow(
                 title: "Routing Number:",
                 trailing: "423555222 "
             ),
             _customRow(
                 title: "Cheque Attachment",
                 trailing: ""
             ),
             
             Image.asset("assets/images/cheque.png")
           ],
         ),

       ),
    ],
  ),
    );
  }
}


Widget _customRow({String? title, String? trailing,Widget?isDivider}){
  return Column(
    children: [
      ListTile(
        title: CustomText(
         text: title?? ' ',
          style: TextStyle(
            color: Color(0xFF455468),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: CustomText(
        text:trailing?? '',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF5E718D),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

      ),
      isDivider??  Divider(height: 0,color: AppColors.primarySlate50,)
    ],
  );
}