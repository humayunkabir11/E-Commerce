import 'package:aji/core/common/widgets/image/skelton_box.dart';
import 'package:aji/core/config/Strings/api_endpoint.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CacheImage extends StatelessWidget {
  final String? imageUrl;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final double height;
  final double width;
  final BoxFit? fit;
  final double borderRadius;

  const CacheImage(
      {super.key,
      required this.imageUrl,
      this.placeHolder,
      this.errorWidget,
      this.height = 60,
      this.width = 60,
      this.borderRadius = 0,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: imageUrl ?? " ",
        placeholder: (context, url) =>
            placeHolder ??
            Center(
              child: SkeletonBox(height: height, width: width),
            ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            SvgPicture.asset(
              'assets/images/img_placeholder.svg',
              height: height,
              width: width,
            ),
      ),
    );
  }
}
