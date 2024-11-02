import 'dart:ui';

import 'package:aji/core/config/color/app_colors.dart';

class ActionModel {
  final String iconSrc;
  final String label;
  final Color color;

  ActionModel(
      {required this.iconSrc, required this.label, required this.color});
}

final actions = [
  ActionModel(
      iconSrc: 'assets/icons/ic_cart.svg',
      label: "Orders",
      color: AppColors.emerald500),
  ActionModel(
      iconSrc: 'assets/icons/ic_card.svg',
      label: "Balance",
      color: AppColors.indigo500),
  ActionModel(
      iconSrc: 'assets/icons/ic_payment_card.svg',
      label: "Payment",
      color: AppColors.orange500),
];
