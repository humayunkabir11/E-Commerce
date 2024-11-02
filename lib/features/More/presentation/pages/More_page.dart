import 'package:aji/core/LocalDataBase/localdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../Login/presentation/pages/Login_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('More Options'),),

      body: ListView(
        children: [
          /// =========================="Product Return",
          _customRow(
              onTap: () {
               context.pushNamed(Routes.orderPage);
              },
              title: "Product Return",
              image: Assets.icons.receiptRefund.svg()
          ),
          /// =========================Order History
          _customRow(
              onTap: () {
                context.pushNamed(Routes.orderHistoryPage);
              },
              title: "Order History",
              image: Assets.icons.shoppingBag.svg()
          ),

          /// =========================Sample Product History
          _customRow(
              onTap: () {
                context.pushNamed(Routes.orderHistoryPage);
              },
              title: "Sample Product History ",
              image: Assets.icons.shoppingBag.svg()
          ),

          /// =========================Notifications
          _customRow(
              onTap: () {
                context.pushNamed(Routes.notificationPage);
              },
              title: "Notifications",
              image: Assets.icons.icNotification.svg(color: Color(0xffFF7A72)
              )
          ),
          /// =========================Dealer Information

          _customRow(
              onTap: () {
                 context.pushNamed(Routes.dealerInfo);
              },
              title: "Dealer Information",
             image: Assets.icons.identification2x.svg()
          ),


          _customRow(
              onTap: () {
                context.pushNamed(Routes.bankDetails);
              },
              title: "Bank Details",
              image: Assets.icons.library.svg()
          ),

          _customRow(
              onTap: () {
               context.pushNamed(Routes.documentsAttachment);
              },
              title: "Document Attachments",
              image: Assets.icons.documentDuplicate.svg()
          ),

          _customRow(
              onTap: () {
                context.pushNamed(Routes.settingsPage);
              },
              title: "Settings",
              image: Assets.icons.setting.svg()
          ),

          _customRow(
              onTap: () {
                // context.pushNamed(Routes.settingsPage);
              },
              title: "User Manual",
              image: Assets.icons.menually.svg()
          ),
          _customRow(
              onTap: () {
                DBHelper().clearUserData().then((value) {
                  context.goNamed(Routes.loginPage);
                });
              },
              title: "Logout",
              titleColor: AppColors.primaryColor,
              icons : Assets.icons.logout.svg()
          ),

        ],
      ),
    );

  }
}


Widget _customRow(
    {String ? title, Widget? image,Widget ?icons, VoidCallback ? onTap,Color ? titleColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,

      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  image ?? SizedBox(),
                  CustomText(
                    left: 8,
                    text: title ?? "", style: robotoMedium.copyWith(
                    color: titleColor??  AppColors.primarySlate600,
                    fontSize: 16.sp,
                  ),),
                ],
              ),
              icons?? Assets.icons.icArrowForward.svg(color: AppColors.primarySlate400,),
            ],
          ),
        ],
      ),
    ),
  );
}