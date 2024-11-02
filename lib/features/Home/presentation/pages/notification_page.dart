import 'package:flutter/material.dart';

import '../../../../core/common/widgets/Appbar/custom_appbar.dart';
import '../../../../core/common/widgets/card/info_card.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Notifications (1)",
          style: robotoSemiBold.copyWith(
              fontSize: 18,
              color: AppColors.primarySlate700,
              letterSpacing: -0.2),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return InfoCard(
          iconSrc: 'iconSrc',
          isWaiting: index % 2 == 0,
        );
      }),
    );
  }
}
