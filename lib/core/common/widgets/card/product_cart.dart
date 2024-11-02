import 'package:aji/core/common/widgets/image/cache_image.dart';
import 'package:aji/core/common/widgets/text/custom_text.dart';
import 'package:aji/core/config/Strings/api_endpoint.dart';
import 'package:aji/core/config/Strings/app_strings.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCart extends StatelessWidget {
  final String ? brandName;
  final String ? offerPrice;
  final String ? disCount;
  final String ? itemQty;
  final String ? subTotalTitle;
  final String ? subTotalAmout;
  final String ? productImage;
  final Widget ? divider;
  final Widget ? icons;

  const ProductCart({super.key, this.brandName, this.offerPrice, this.disCount, this.itemQty, this.divider, this.icons, this.productImage, this.subTotalTitle, this.subTotalAmout});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all( 12),
      margin: EdgeInsets.only(top: 12),
      color: Colors.white,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CacheImage(
            height: 100,
              width: 100,
              borderRadius: 6.r,
              imageUrl: ApiEndpoint.imageBaseUrl+(productImage ?? "")
          ),
          SizedBox(width: 12,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  maxLines: 2,
                  text: brandName ?? "",
                  style: robotoMedium.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.primarySlate800
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Offer Price (BDT) :",style:robotoMedium.copyWith(
                        color: AppColors.primarySlate500,
                       fontSize: 14.sp
                    ),),
                    CustomText(text: offerPrice?? "",style:robotoSemiBold.copyWith(
                        color: AppColors.primarySlate600,
                        fontSize: 14.sp
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Discount (BDT) :",style:robotoMedium.copyWith(
                        color: AppColors.primarySlate500,
                        fontSize: 14.sp
                    ),),
                    CustomText(
                      text: disCount??"",style:robotoSemiBold.copyWith(
                        color: AppColors.primarySlate600,
                        fontSize: 14.sp
                    ),),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Item Quantity (Bag) :",style:robotoMedium.copyWith(
                        color: AppColors.primarySlate500,
                        fontSize: 14.sp
                    ),),
                    CustomText(
                      text: itemQty??"",style:robotoSemiBold.copyWith(
                        color: AppColors.primarySlate600,
                        fontSize: 14.sp
                    ),),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text:subTotalTitle.toString(),style:robotoMedium.copyWith(
                        color: Color(0xffD8A800),

                        fontSize: 14.sp
                    ),),
                    CustomText(
                      text: subTotalAmout.toString(),style:robotoSemiBold.copyWith(
                        color: Color(0xffD8A800),
                        fontSize: 14.sp
                    ),),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 12,),
         divider ?? SizedBox(),
          SizedBox(width: 12,),
         icons ?? SizedBox()

        ],
      ),
    );
  }
}


class VerticalDashedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const VerticalDashedDivider({
    Key? key,
    this.height = 120,
    this.dashWidth = 8,
    this.dashSpace = 5,
    this.color = AppColors.primarySlate300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: DashedLinePainter(
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          color: color,
        ),
      ),
    );
  }
}




class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DashedLinePainter({this.dashWidth = 5, this.dashSpace = 5, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}