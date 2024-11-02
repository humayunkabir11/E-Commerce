import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class TargetAchievementCard extends StatefulWidget {
  @override
  _TargetAchievementCardState createState() => _TargetAchievementCardState();
}

class _TargetAchievementCardState extends State<TargetAchievementCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double targetPercentage = 0.85; // Example: 85%

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: targetPercentage).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 12),

      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xFFDEE1E5), width: 1)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Target vs Achievement",
                  style: robotoSemiBold.copyWith(
                    color: AppColors.primarySlate700,
                    fontSize: 18,
                  ),
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
                  child: SvgPicture.asset('assets/icons/ic_calendar.svg'),
                ),
              ],
            ),
            Gap(4),
            Text(
              "15 August 2024",
              style: robotoMedium.copyWith(
                color: AppColors.primaryError400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            // Arc + percentage
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(220, 220), // Larger size to include the dashed arc
                        painter: ArcPainter(_animation.value),
                      );
                    },
                  ),
                  // Achievement container
                  Container(
                    padding: EdgeInsets.all(4),
                    constraints: BoxConstraints(minHeight: 110, minWidth: 110),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          offset: Offset(0, 3.82),
                          blurRadius: 19.11,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Achievement",
                          style: robotoSemiBold.copyWith(
                            fontSize: 12,
                            color: AppColors.primarySlate800,
                          ),
                        ),
                        // Wrap percentage text in AnimatedBuilder
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Text(
                              "${(_animation.value * 100).toInt()}%",
                              style: robotoBold.copyWith(
                                color: AppColors.primarySlate800,
                                fontSize: 36,
                                letterSpacing: -1.31,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Achievement 120k | ",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        Gap(8),
                        Text(
                          "Target 200k",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double percentage;

  ArcPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final startAngle = -pi;
    final sweepAngle = pi * percentage; // The sweep angle depends on the percentage
    final useCenter = false;

    // 1. Paint for the background arc (full arc with orange gradient)
    final backgroundArcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30
      ..shader = LinearGradient(
        colors: [Colors.deepOrange, Colors.orange],
      ).createShader(arcRect);

    // Draw the background arc (complete arc)
    canvas.drawArc(arcRect, startAngle, pi, useCenter, backgroundArcPaint);

    // 2. Paint for the main arc (achievement arc)
    final achievementPaint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30
      ..shader = LinearGradient(
        colors: [Color(0xFFFFB199), Color(0xFFFF0844)],
      ).createShader(arcRect);

    // Draw the achievement arc (partial arc based on percentage)
    canvas.drawArc(arcRect, startAngle, sweepAngle, useCenter, achievementPaint);

    // 3. Paint for the dashed arc (above the container)
    final dashPaint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..shader = LinearGradient(
        colors: [Colors.redAccent, Colors.orange],
      ).createShader(arcRect);

    // Draw dashed arc outside the main achievement container
    drawDashedArc(canvas, size, dashPaint);

    // 4. Paint for the white line at the top of the arc
    final linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    // Calculate the position of the line based on the percentage
    final double lineAngle = startAngle + sweepAngle; // The angle at the end of the arc

    // Calculate the line's position based on this angle
    final double radius = size.width / 2; // Half the width of the canvas is the radius of the arc
    final double lineLength = 30; // Match the arc's stroke width for line height

    final Offset lineStart = Offset(
      size.width / 2 + (radius - 15) * cos(lineAngle), // Adjusted radius for correct positioning
      size.height / 2 + (radius - 15) * sin(lineAngle),
    );

    final Offset lineEnd = Offset(
      size.width / 2 + (radius - 15 + lineLength) * cos(lineAngle), // Extend to match the arc's stroke width
      size.height / 2 + (radius - 15 + lineLength) * sin(lineAngle),
    );

    // Draw the white line at the head of the progress arc
    canvas.drawLine(lineStart, lineEnd, linePaint);
  }

  void drawDashedArc(Canvas canvas, Size size, Paint paint) {
    const double dashWidth = 6; // Width of the dash
    const double dashSpace = 10; // Space between dashes
    final arcRect = Rect.fromLTWH(40, 40, size.width - 80, size.height - 80); // Adjust arc for dashed arc positioning

    double startAngle = -pi;
    double sweepAngle = pi;

    // Total arc length
    final double totalArcLength = sweepAngle * arcRect.width;

    // Calculate the number of dashes based on the arc length and dash width + dash space
    final int dashCount = (totalArcLength / (dashWidth + dashSpace)).floor();

    // Draw each dash with space
    for (int i = 0; i < dashCount; i++) {
      final double dashStartAngle = startAngle + (i * (dashWidth + dashSpace) / arcRect.width);
      canvas.drawArc(arcRect, dashStartAngle, dashWidth / arcRect.width, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
