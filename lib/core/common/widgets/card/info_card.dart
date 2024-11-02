import 'package:aji/core/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';

class InfoCard extends StatelessWidget {
  final String iconSrc;
  final bool isWaiting;
  
  const InfoCard({super.key, required this.iconSrc, this.isWaiting = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // context.pushNamed(Routes.checkoutPage);
      },
      child: Column(
        children: [
          //-------------------------------------information
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------------------order number
                Text(
                  'Order Number: XXXXS654',
                  style: robotoMedium.copyWith(
                      fontSize: 16,
                      letterSpacing: -0.2,
                      color: AppColors.primarySlate800),
                ),
                Gap(16),

                //------------------------------date
                _buildInfo(key: "Date :", value: "12 Jun, 2024"),
                Gap(6),

                //------------------------------price
                _buildInfo(key: "Price (BDT) :", value: "465"),
                Gap(6),

                //------------------------------quantity
                _buildInfo(key: "Item Quantity (Bag) :", value: "3x"),
                Gap(6),

                //------------------------------Delivery Charge
                _buildInfo(key: "Delivery Charge (BDT) :", value: "1200"),
                Gap(6),

                //------------------------------Delivery Charge
                _buildInfo(
                    key: "Total (BDT) :",
                    value: "1395",
                    keyColor: AppColors.primaryColor,
                    valueColor: AppColors.primaryColor),
                Gap(6),
              ],
            ),
          ),

          //-------------------------------------status
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        width: 1, color: AppColors.primarySlate200))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //------------------------------------leading icon
                    SvgPicture.asset(
                      'assets/icons/ic_checks.svg',
                      colorFilter: ColorFilter.mode(
                          AppColors.violet200, BlendMode.srcIn),
                    ),

                    //------------------------------------status
                    Gap(6),
                    Text(
                      'Waiting for Receiving',
                      style: robotoMedium.copyWith(
                          fontSize: 14,
                          letterSpacing: -0.2,
                          color: AppColors.violet200),
                    ),
                  ],
                ),

                //------------------------------------ trailing
                isWaiting? Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.violet200,
                ) :
                    //---------------------------------date
                Text('31 Jul, 2024', style: robotoMedium.copyWith(
                  fontSize: 14,
                  color: AppColors.primarySlate400,
                  letterSpacing: -0.2
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfo(
      {required String key,
        required String value,
        Color? keyColor,
        Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: robotoMedium.copyWith(
              fontSize: 14,
              color: keyColor ?? AppColors.primarySlate500,
              letterSpacing: -0.2),
        ),
        Text(
          value,
          style: robotoSemiBold.copyWith(
            fontSize: 14,
            color: valueColor ?? AppColors.primarySlate600,
          ),
        ),
      ],
    );
  }
}
