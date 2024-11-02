import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';

class DateRangePicker extends StatelessWidget {
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return DatePickerBottomSheet();
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: AppColors.primaryError200)),
        child: Row(
          children: [
            Text(
              'Aug 1, 2024 -- Sep 10, 2024',
              style: robotoMedium.copyWith(
                  fontSize: 14, color: AppColors.primaryColor),
            ),
            Container(
              width: 1,
              color: AppColors.primarySlate200,
              height: 16,
              margin: EdgeInsets.symmetric(horizontal: 6),
            ),
            SvgPicture.asset('assets/icons/ic_calender_31.svg')
          ],
        ),
      ),
    );
  }
}

class DatePickerBottomSheet extends StatefulWidget {
  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  late DateRangePickerController controller;

  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut(() => DateRangePickerController());
    controller = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List of years from 2018 to 2030
    List<int> years = List.generate(13, (index) => 2018 + index);

    // List of month names
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //-------------------------title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Date Range",
                style: robotoSemiBold.copyWith(
                  fontSize: 16,
                  color: AppColors.primarySlate800,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: AppColors.primarySlate500,
                ),
              ),
            ],
          ),

          SizedBox(height: 26), // Space between title and the content

          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primarySlate200,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Year",
                  style: robotoSemiBold.copyWith(
                    color: AppColors.primarySlate800,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "From",
                  style: robotoSemiBold.copyWith(
                    color: AppColors.primarySlate800,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "To",
                  style: robotoSemiBold.copyWith(
                    color: AppColors.primarySlate800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16), // Space between header and list

          // Use a constrained height if needed
          SizedBox(
            height: 200, // Set height for the list area
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.years.length,
                    itemBuilder: (context, index) {
                      return Obx(() => _buildDateItem(
                          onTap: () {
                            controller.updateSelectedYear(index);
                          },
                          isSelected: controller.selectedYear == index,
                          text: controller.years[index].toString()));
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.months.length,
                    itemBuilder: (context, index) {
                      return Obx(() => _buildDateItem(
                          onTap: () {
                            controller.updateSelectedFromMonth(index);
                          },
                          isSelected: controller.selectedFromMonth == index,
                          text: controller.months[index]));
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.months.length,
                    itemBuilder: (context, index) {
                      return Obx(() => _buildDateItem(
                          onTap: () {
                            controller.updateSelectedToMonth(index);
                          },
                          isSelected: controller.selectedToMonth == index,
                          text: controller.months[index]));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(
      {required void Function()? onTap,
      required bool isSelected,
      required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        margin: EdgeInsets.all(6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primarySlate50 : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r)),
        child: Text(text,
            style: robotoMedium.copyWith(
                fontSize: 16,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primarySlate400)),
      ),
    );
  }
}

class DateRangePickerController extends GetxController {
  final _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ].obs;
  List<String> get months => _months;

  final _years = List.generate(13, (index) => 2018 + index).obs;
  List<int> get years => _years.toList();

  final _selectedYear = 0.obs;
  int get selectedYear => _selectedYear.value;

  final _selectedToMonth = 0.obs;
  int get selectedToMonth => _selectedToMonth.value;

  final _selectedFromMonth = 0.obs;
  int get selectedFromMonth => _selectedFromMonth.value;

  void updateSelectedYear(int idx) {
    _selectedYear.value = idx;
  }

  void updateSelectedToMonth(int idx) {
    _selectedToMonth.value = idx;
  }

  void updateSelectedFromMonth(int idx) {
    _selectedFromMonth.value = idx;
  }
}
