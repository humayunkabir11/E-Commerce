import 'package:aji/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:aji/core/routes/route_path.dart';
import 'package:aji/features/Settings/presentation/widget/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Settings",
          style: robotoSemiBold.copyWith(
              color: AppColors.primarySlate700, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 12),
          color: Colors.white,
          child: Column(
            children: [
              //----------------------------shipping address
              SettingsTile(
                  text: "Shipping Address",
                onTap: (){
                    context.pushNamed(Routes.shippingAddressListPage);
                },
              ),

              //----------------------------show user profile
              SettingsTile(
                text: "User Profile",
                onTap: (){
                  context.pushNamed(Routes.userProfile);
                },
              ),

              //------------------------------change password
              SettingsTile(
                text: "Password Change",
                showLine: false,
                onTap: (){
                  context.pushNamed(Routes.changePassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
