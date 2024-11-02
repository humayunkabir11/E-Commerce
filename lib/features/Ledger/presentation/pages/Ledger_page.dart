import 'package:aji/core/common/widgets/card/date_range_picker.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LedgerPage extends StatelessWidget {
  const LedgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ledger',
            style: robotoSemiBold.copyWith(
                color: AppColors.primarySlate700, fontSize: 18)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/ic_download.svg')),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/ic_printer.svg')),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Ledger of:", style: robotoMedium.copyWith(
                color: AppColors.primarySlate500,
                fontSize: 14
              ),),

              Gap(6),

              Text("11189-M/S Monir Auto Engineering", style: robotoMedium.copyWith(
                  color: AppColors.primarySlate800,
                  fontSize: 16
              ),),

              //date range
              Gap(16),
              Row(
                children: [
                  Text("Date Range:", style: robotoMedium.copyWith(
                      color: AppColors.primarySlate500,
                      fontSize: 14
                  ),),

                  Gap(12),

                  DateRangePicker()
                ],
              ),

              //data table
              Gap(16),
              Container(
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  child: DataTableWidget(),
                ),
              ),
              Gap(16),

              //pagination
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    padding: EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.5, color: AppColors.primarySlate500)),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: AppColors.primarySlate500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                        text: TextSpan(
                            text: "Page: ",
                            style: robotoMedium.copyWith(
                                color: AppColors.primarySlate500, fontSize: 16),
                            children: [
                          TextSpan(
                              text: "1",
                              style: robotoMedium.copyWith(
                                  color: AppColors.primaryColor, fontSize: 16)),
                          TextSpan(
                              text: "/5",
                              style: robotoMedium.copyWith(
                                  color: AppColors.primarySlate500,
                                  fontSize: 16))
                        ])),
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    padding: EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.5, color: AppColors.primaryColor)),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'SL': '1',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': 'Damage return from'
    },
    {
      'SL': '2',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': 'Sales'
    },
    {
      'SL': '3',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': '0'
    },
    {
      'SL': '4',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': '0'
    },
    {
      'SL': '5',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': '0'
    },
    {
      'SL': '6',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': 'Sales'
    },
    {
      'SL': '7',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': '0'
    },
    {
      'SL': '8',
      'Date': '22/08/2024',
      'RefNo': 'RV-N-24-1234',
      'Particular': 'Sales'
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return Container(); // Handle empty data case

    // Extract column names from the first entry in data
    final columns = data.first.keys
        .map((key) => DataColumn(label: Center(child: Text(key))))
        .toList();

    // Generate rows based on data
    final rows = data
        .map((item) => DataRow(
                cells: item.values.map((value) {
              return DataCell(
                Text(
                  value ?? '',
                  textAlign: TextAlign.center,
                ),
              );
            }).toList()))
        .toList();

    return DataTable(
      dataTextStyle: robotoMedium.copyWith(
        color: AppColors.primarySlate700,
        fontSize: 13,
        letterSpacing: -0.2,
      ),
      headingTextStyle: robotoSemiBold.copyWith(
        color: AppColors.primarySlate800,
        fontSize: 16,
        letterSpacing: -0.2,
      ),
      dataRowColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          // Use a default color for the data rows
          return Colors.white; // Change this to your desired color
        },
      ),
      border: TableBorder.all(
        color: AppColors.primarySlate600,
        width: 1,
      ),
      columns: columns,
      rows: rows,
    );
  }
}
