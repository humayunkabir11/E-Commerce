import 'package:aji/features/cart/presentation/widget/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class NewOrderBottom extends StatelessWidget {
  final void Function()? onRegularOrder;
  final void Function()? onSimpleOrder;
  const NewOrderBottom({super.key, this.onRegularOrder, this.onSimpleOrder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Order Type",
                style: robotoRegular.copyWith(
                    fontSize: 16.sp, color: AppColors.primarySlate700),
              ),
              InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Assets.icons.icClose.svg())
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                    child: CartWidget(
                  ontap: onRegularOrder,
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: CartWidget(
                  ontap: onSimpleOrder,
                  text: "Sample Order",
                  colorText: AppColors.primarySlate500,
                  color: Color(0xffF9FAFB),
                  iconColor: AppColors.primarySlate500,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
