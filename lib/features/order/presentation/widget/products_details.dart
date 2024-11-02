import 'package:aji/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:aji/core/common/widgets/image/cache_image.dart';
import 'package:aji/features/order/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/text/custom_text.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class ProductsDetails extends StatelessWidget {
  final Product? product;

  const ProductsDetails({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.80, //set this as you want
        maxChildSize: 0.80, //set this as you want
        minChildSize: 0.50, //set this as you wan
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: [
              CustomAppBar(
                leading: SizedBox(),
                leadingWidth: 16,
                backgroundColor: Colors.transparent,
                title: Text("Product Details",
                    style: robotoRegular.copyWith(
                        fontSize: 16.sp, color: AppColors.primarySlate800)),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.primarySlate500,
                    ),
                  ),
                  Gap(16)
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: CacheImage(
                            imageUrl: ApiEndpoint.imageBaseUrl + product!.image!,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CustomText(
                        top: 8,
                        bottom: 8,
                        maxLines: 4,
                        text: product?.name ?? "",
                        style: robotoMedium.copyWith(
                            color: AppColors.primarySlate700, fontSize: 18.sp),
                      ),
                      CustomText(
                        maxLines: 4,
                        text: product?.description ?? "",
                        style: robotoRegular.copyWith(
                            color: AppColors.primarySlate600, fontSize: 14.sp),
                      ),
                      CustomText(
                        top: 12,
                        bottom: 8,
                        maxLines: 4,
                        text: "Advantage",
                        style: robotoRegular.copyWith(
                            color: AppColors.primarySlate700, fontSize: 14.sp),
                      ),
                      CustomText(
                        bottom: 12,
                        maxLines: 100,
                        text: product?.orderNote ?? "",
                        style: robotoRegular.copyWith(
                            color: AppColors.primarySlate500, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
