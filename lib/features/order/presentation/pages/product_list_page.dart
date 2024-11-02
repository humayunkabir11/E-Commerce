import 'package:aji/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:aji/core/common/widgets/Button/elevated_button.dart';
import 'package:aji/core/common/widgets/card/product_tile.dart';
import 'package:aji/core/common/widgets/empty_widget.dart';
import 'package:aji/core/common/widgets/loading/loading_widget.dart';
import 'package:aji/core/config/color/app_colors.dart';
import 'package:aji/core/config/util/style.dart';
import 'package:aji/features/order/presentation/controller/order_controller.dart';
import 'package:aji/features/order/presentation/widget/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.find<OrderController>();

    Future.delayed(Duration.zero, () {
      controller.getProducts();
      controller.getCategories();
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "Product List",
          style: robotoSemiBold.copyWith(
              fontSize: 18,
              letterSpacing: -0.2,
              color: AppColors.primarySlate800),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/ic_search.svg'),
          )
        ],
      ),
      body: Column(
        children: [
          //----------------------------------------------categories
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
            padding: EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 8),
            child: Column(
              children: [
                //--------------------------------------------category, see all
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate700, fontSize: 14),
                    ),
                    //--------------------------------------see all button
                    Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Row(
                            children: [
                              Text(
                                'See All',
                                style: robotoMedium.copyWith(
                                    color: Color(0xFF4A72FF), fontSize: 14),
                              ),
                              Gap(6),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: Color(0xFF4A72FF),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
                //--------------------------------------------category list
                Expanded(
                  child: Obx(() => controller.categoryLoading.value
                      ? LoadingWidget()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(top: 16),
                          itemCount: controller.category.length,
                          itemBuilder: (context, index) {
                            return Obx(() => Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: CategoryTile(
                                    isSelected:
                                        (controller.selectcatgeory.value!=null&&controller.selectcatgeory.value!.id == controller.category[index].id),
                                    onTap: () {
                                      controller.selectcatgeory.value=controller.category[index];
                                      controller.filteredSubCategory.value.clear();
                                      controller.filteredSubCategory.value=controller.subCategory.where((cat) => cat.parentCategoryId == controller.category[index].id).toList();
                                      controller.selectSubCategory.value=null;
                                      controller.getProducts(categoryId: controller.category[index].id,);

                                    },
                                    text: controller.category[index].name ?? "",
                                  ),
                                ));
                          },
                        )),
                )
              ],
            ),
          ),

          //-----------------------------------------------product list
          Expanded(
            child: Obx(() => controller.productLoading
                ? LoadingWidget()
                : controller.productList.isEmpty? EmptyWidget() : ListView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        product: controller.productList[index],
                      );
                    })),
          ),

          // SizedBox.square(
          //   dimension: 20,
          //     child: CircularProgressIndicator(
          //       strokeWidth: 2,
          //     )
          // )
        ],
      ),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search Filter',
                          style: robotoSemiBold.copyWith(
                              color: AppColors.primarySlate800, fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.clear,
                            color: AppColors.primarySlate500,
                          ),
                        )
                      ],
                    ),

                    //----------------------------------------category
                    Gap(26),
                    Text(
                      'Category',
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate800, fontSize: 16),
                    ),
                    Gap(12),
                    Obx(() =>  Wrap(
                          spacing: 8, // Adds space between tiles
                          runSpacing: 12, // Adds space between rows
                          children: List.generate(
                            controller.category.length,
                            (index) => CategoryTile(
                              isSelected: (controller.selectcatgeory.value!=null&&controller.selectcatgeory.value!.id == controller.category[index].id),
                              onTap: () {
                                controller.selectcatgeory.value=controller.category[index];
                                controller.filteredSubCategory.clear();
                                controller.filteredSubCategory.value=controller.subCategory.where((cat) => cat.parentCategoryId == controller.category[index].id).toList();
                                controller.selectSubCategory.value=null;
                                controller.getProducts(categoryId: controller.category[index].id,);
                              },
                              text: controller.category[index].name ?? "",
                            ),
                          ),
                        )),

                    //----------------------------------------sub category
                    Gap(46),
                    Text(
                      'Sub Category',
                      style: robotoMedium.copyWith(
                          color: AppColors.primarySlate800, fontSize: 16),
                    ),
                    Gap(12),
                    Obx(() => controller.filteredSubCategory.isEmpty? EmptyWidget() : Wrap(
                          spacing: 8, // Adds space between tiles
                          runSpacing: 12, // Adds space between rows
                          children: List.generate(
                            controller.filteredSubCategory.length,
                            (index) => CategoryTile(
                              isSelected: (controller.selectSubCategory.value!=null&&controller.selectSubCategory.value!.id == controller.filteredSubCategory[index].id),
                              onTap: () {
                                controller.selectSubCategory.value=controller.filteredSubCategory[index];
                                controller.getProducts(
                                    categoryId:controller.selectcatgeory.value==null?null: controller.selectcatgeory.value!.id,
                                    subCategoryId: controller.selectSubCategory.value!.id
                                );
                              },
                              text:
                                  controller.filteredSubCategory[index].name ??
                                      "",
                            ),
                          ),
                        )),
                  ],
                ),

                //----------------------------------------action
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      buttonWidth: 120,
                      buttonHeight: 40,
                      onPressed: () {
                        context.pop();
                      },
                      titleText: 'Cancel',
                      titleColor: AppColors.primaryColor,
                      buttonColor: AppColors.error25,
                    ),
                    CustomElevatedButton(
                        buttonWidth: 120,
                        buttonHeight: 40,
                        onPressed: () {
                          controller.getProducts(
                              categoryId:controller.selectcatgeory.value==null?null: controller.selectcatgeory.value!.id,
                              subCategoryId: controller.selectSubCategory.value!.id
                          );
                          context.pop();
                        },
                        titleText: 'Done')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
