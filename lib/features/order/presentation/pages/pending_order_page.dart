import 'package:aji/core/common/widgets/empty_widget.dart';
import 'package:aji/features/order/presentation/widget/pending_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:aji/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:aji/core/common/widgets/line/dash_line.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';

final Map<String, List<int>> orders = const {
  '16 Aug': [1, 2, 3, 4],
  '18 Aug': [1, 2, 3, 4],
  '26 Aug': [1, 2, 3, 4, 3, 4, 5, 6, 7, 8, 43, 56, 67],
};

class PendingOrderPage extends StatelessWidget {
  const PendingOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primarySlate400,
            size: 24,
          ),
        ),
        title: Text(
          "Pending Orders",
          style: robotoMedium.copyWith(
            fontSize: 18,
            color: AppColors.primarySlate800,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: orders.isEmpty
            ? EmptyWidget()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: orders.entries.map((entry) {
                    final String date = entry.key;
                    final List<int> items = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row showing date and dashed line
                        Row(
                          children: [
                            Text(
                              date,
                              style: robotoRegular.copyWith(
                                fontSize: 14,
                                color: AppColors.primarySlate600,
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              child: DashedLine(
                                color: AppColors.primarySlate300,
                                dashSpace: 6,
                                dashWidth: 5,
                                direction: DashLineDirection.horizontal,
                              ),
                            ),
                          ],
                        ),

                        const Gap(12),
                        // List of items for each date
                        ListView.builder(
                          shrinkWrap:
                              true, // Ensures it doesn't scroll inside the parent SingleChildScrollView
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return PendingTile();
                          },
                        ),
                        const Gap(
                            16), // Adds some spacing between date sections
                      ],
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }
}
