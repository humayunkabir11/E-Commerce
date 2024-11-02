import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class AddressTile extends StatelessWidget {
  final void Function()? onSelect;
  final void Function()? onEdit;
  final int index;
  final bool isSelected;

  const AddressTile(
      {super.key,
      this.onSelect,
      this.onEdit,
      required this.index,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.primarySlate200,
      )),
      child: Column(
        children: [
          //------------------------------------------radio selector
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColors.primarySlate200))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$index. Address",
                    style: robotoMedium.copyWith(
                        color: AppColors.primarySlate800, fontSize: 16),
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    padding: EdgeInsets.all(6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            isSelected ? Colors.red : AppColors.primarySlate25,
                        border: isSelected
                            ? null
                            : Border.all(color: AppColors.primarySlate300)),
                    child: isSelected
                        ? SvgPicture.asset('assets/icons/ic_done.svg')
                        : null,
                  )
                ],
              ),
            ),
          ),

          //------------------------------------------content
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              children: [
                _buildInfo(key: "Contact Name:", value: "Md Monirul Islam"),
                Gap(6),
                _buildInfo(key: "District:", value: "Comilla"),
                Gap(6),
                _buildInfo(key: "Police Station:", value: "Chandina"),
                Gap(6),
                _buildInfo(
                    key: "Address:", value: "Chandina, Boraiya, Boraiya"),
                Gap(6),
                _buildInfo(key: "Contact Number:", value: "+8801 98765342"),
                Gap(6),
                _buildInfo(key: "Email:", value: "name@email.com"),
              ],
            ),
          ),

          //------------------------------------------action edit
          GestureDetector(
            onTap: onEdit,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: AppColors.primarySlate200))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_edit1.svg',
                        colorFilter: ColorFilter.mode(
                            AppColors.primarySlate400, BlendMode.srcIn),
                      ),
                      Gap(6),
                      Text(
                        "Edit",
                        style: robotoMedium.copyWith(
                            fontSize: 16, color: AppColors.primarySlate400),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.primarySlate400,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfo({required String key, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: robotoMedium.copyWith(
              color: AppColors.primarySlate600, fontSize: 16),
        ),
        Text(
          value,
          style: robotoRegular.copyWith(
              color: AppColors.primarySlate500,
              fontSize: 14,
              letterSpacing: -0.2),
        )
      ],
    );
  }
}
