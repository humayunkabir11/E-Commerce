import 'package:aji/core/config/Strings/api_endpoint.dart';
import 'package:aji/core/routes/route_path.dart';
import 'package:aji/features/order/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';
import '../image/cache_image.dart';
import '../line/dash_line.dart';

class ProductTile extends StatelessWidget {
  final Product? product;
  final void Function()? onTap;
  const ProductTile({super.key, this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            CacheImage(
              imageUrl: ApiEndpoint.imageBaseUrl+product!.image!,
              height: 100,
              width: 100,
              borderRadius: 6.r,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //---------------------------------product name
                  Text(
                    product?.name ?? "",
                    maxLines: 2,
                    style: robotoMedium.copyWith(
                        fontSize: 16,
                        color: AppColors.primarySlate800,
                        letterSpacing: -0.2,
                        overflow: TextOverflow.ellipsis),
                  ),
      
                  Gap(8),
      
                  _buildInfo(
                      key: "Regular Price (BDT) :",
                      value: "${product?.regularPrice ?? 0.0}",
                      valueStyle: robotoSemiBold.copyWith(
                          fontSize: 14,
                          color: AppColors.primarySlate600,
                          decoration: TextDecoration.lineThrough)),
      
                  _buildInfo(
                    key: "Offer Price (BDT) :",
                    value: "${product?.offerPrice ?? 0.0}",
                  )
                ],
              ),
            )),
            DashedLine(
              direction: DashLineDirection.vertical,
              color: AppColors.primarySlate300,
            ),
            IconButton(
                onPressed: () {
                  context.pushNamed(Routes.updateItemPage,extra: product);
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(
      {required String key,
      required String value,
      TextStyle? valueStyle,
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
          style: valueStyle ??
              robotoSemiBold.copyWith(
                fontSize: 14,
                color: valueColor ?? AppColors.primarySlate600,
              ),
        ),
      ],
    );
  }
}
