
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/core/custom_assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DealerInformation extends StatelessWidget {
  const DealerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dealer Information'),

      actions: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Color(0xffF2FFF9),
            borderRadius: BorderRadius.circular(4),
          ),
          child: CustomText(
            text: "Active",
            style: robotoMedium.copyWith(
              color: Color(0xff11A75C),
              fontSize: 14.sp
            ),
          ),
        )
      ],
      ),
  body: ListView(
    children: [

      /// =================  order delivery stutas
       Container(
         margin: EdgeInsets.only(top: 16,
         bottom: 12),
         color: Colors.white,
         padding: EdgeInsets.only(top: 12),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               child: Row(
                 children: [
                  SvgPicture.asset("assets/icons/ic_print.svg"),
                   CustomText(
                     left: 12,
                     text: 'Order Delivery Status',
                     style: robotoSemiBold.copyWith(
                         color: Color(0xff4A72FF),
                         fontSize: 16
                     ),
                   )

                 ],
               ),
             ),
             _customRow(
               title: "Business Type:",
               trailing: "Dealer"
             ),

             _customRow(
                 title: "Ownership Type:",
                 trailing: "Sole Proprietorship"
             ),

             _customRow(
                 title: "District:",
                 trailing: "Comilla"
             ),

             _customRow(
                 title: "Police Station:",
                 trailing: "Comilla"
             ),

             _customRow(
                 title: "Address:",
                 trailing: "Chandina, Boraiya, Boraiya "
             ),
             _customRow(
                 title: "Contact Number:",
                 trailing: "+8801 98765342 "
             ),
             _customRow(
                 title: "Email:",
                 trailing: "+name@email.com "
             ),
           ],
         ),

       ),


      /// =================  Regional Information
      Container(
        padding: EdgeInsets.only(top: 12),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_regional.svg"),
                  CustomText(
                    left: 12,
                    text: 'Regional Information',
                    style: robotoSemiBold.copyWith(
                        color: Color(0xff4A72FF),
                        fontSize: 16
                    ),
                  )

                ],
              ),
            ),
            _customRow(
                title: "Zone:",
                trailing: "Zone:"
            ),

            _customRow(
                title: "Market Type:",
                trailing: "Market Type:"
            ),

            _customRow(
                title: "Provincial:",
                trailing: "Provincial:"
            ),

            _customRow(
                title: "Divisional:",
                trailing: "Divisional:"
            ),

            _customRow(
                title: "Zonal:",
                trailing: "Zonal: "
            ),
            _customRow(
                title: "Area:",
                trailing: "Area: "
            ),
            _customRow(
                title: "Territory:",
                trailing: "Territory: "
            ),
            _customRow(
                title: "Periphery:",
                trailing: "Periphery:: "
            ),
          ],
        ),

      ),

      /// =================  Proprietor Info

      Container(
        padding: EdgeInsets.only(top: 12),
        margin: EdgeInsets.only(bottom: 12,top: 12),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_per1.svg"),
                  CustomText(
                    left: 12,
                    text: 'Proprietor Info',
                    style: robotoSemiBold.copyWith(
                        color: Color(0xff4A72FF),
                        fontSize: 16
                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: 16,),
            Image.asset("assets/images/person.png"),

            SizedBox(height: 16,),

            _customRow(
                title: "Name:",
                trailing: "kabir khan:"
            ),

            _customRow(
                title: "Date of Birth:",
                trailing: "26 Aug, 1952"
            ),

            _customRow(
                title: "Gender:",
                trailing: "Male"
            ),

            _customRow(
                title: "District:",
                trailing: "Comilla"
            ),

            _customRow(
                title: "Police Station:",
                trailing: "Chandina"
            ),
            _customRow(
                title: "Address:",
                trailing: "Chandina, Boraiya, Boraiya"
            ),
            _customRow(
                title: "NID/Passport:",
                trailing: "9876255322 "
            ),
            _customRow(
                title: "Contact Number:",
                trailing: "+8801 98765342 "
            ),
            _customRow(
                title: "Email:",
                trailing: "name@email.com"
            ),
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