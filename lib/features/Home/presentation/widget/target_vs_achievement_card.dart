import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';

class TargetVsAchievementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 12),
      child: Container(
        height: 322,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xFFDEE1E5), width: 1)),
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //----------------------------------title and calendar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Target vs Achievement",
                            style: robotoSemiBold.copyWith(
                                color: AppColors.primarySlate700, fontSize: 18),
                          ),
                          Text(
                            "15 August 2024",
                            style: robotoMedium.copyWith(
                                color: AppColors.primaryError400, fontSize: 14),
                          )
                        ],
                      ),
                      GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                          },
                          child: SvgPicture.asset('assets/icons/ic_calendar.svg'))
                    ],
                  ),

                  Gap(18),
                  Container(
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              5,
                              (index) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 1,
                                        height: constraint.maxHeight * 0.5,
                                        color: AppColors.primarySlate200,
                                      ),
                                      Gap(4),
                                      Text(
                                        '${25 * index}%',
                                        style: robotoRegular.copyWith(
                                            fontSize: 14,
                                            color: AppColors.primarySlate500),
                                      )
                                    ],
                                  )),
                        ),
                        Positioned(
                            bottom: 46,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Target Bar
                                _buildBarItem(
                                  maxWidth: constraint.maxWidth,
                                  label: '1000 (BDT)',
                                  percentage: 0.52,
                                  valueText: '-23%',
                                  progressColor: AppColors.primaryColor,
                                ),
                                Gap(8),
                                // Achievement Bar
                                _buildBarItem(
                                  maxWidth: constraint.maxWidth,
                                  label: '180 (BDT)',
                                  percentage: 0.77,
                                  valueText: '77%',
                                  progressColor: AppColors.sky400,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),

              //-----------------------------------bottom label
              Row(
                children: [
                  _chartLabel(label: "Target", dotColor: AppColors.primaryColor),
                  Gap(26),
                  _chartLabel(label: "Achievement", dotColor: AppColors.sky400),
                ],
              )
            ],
          );
        }),
      ),
    );
  }

  //-------------------------bottom label
  Widget _chartLabel({required String label, required Color dotColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 12,
          width: 12,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        Text(
          label,
          style: robotoRegular.copyWith(
              color: AppColors.primarySlate700, fontSize: 16),
        )
      ],
    );
  }

  //-------------------------chart bar
  Widget _buildBarItem(
      {required String label,
      required double percentage,
      required String valueText,
      required Color progressColor,
      required double maxWidth}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: robotoMedium.copyWith(
            fontSize: 14,
            color: AppColors.primarySlate700,
            height: 2,
          ),
        ),
        Container(
          height: 30,
          width: maxWidth * percentage,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6.r),
              bottomRight: Radius.circular(6.r),
            ),
          ),
          child: Text(
            valueText,
            style: robotoMedium.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
