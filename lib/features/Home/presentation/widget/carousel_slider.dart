import 'dart:async';
import 'package:aji/core/common/widgets/image/cache_image.dart';
import 'package:aji/core/config/Strings/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:aji/core/config/color/app_colors.dart';

import '../../data/models/slider_model.dart';

class CarouselSlider extends StatefulWidget {
  final List<SliderModel> sliderList;
  const CarouselSlider({super.key, required this.sliderList});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider>
    with WidgetsBindingObserver {
  final PageController _controller = PageController(initialPage: 0);
  int _page = 0;
  Timer? _carouselTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startCarousel();
  }

  @override
  void dispose() {
    _controller.dispose();
    _carouselTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Start the carousel timer
  void _startCarousel() {
    _carouselTimer?.cancel(); // Avoid multiple timers
    _carouselTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_page == widget.sliderList.length - 1) {
        _page = 0;
      } else {
        _page++;
      }
      _controller.animateToPage(
        _page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  // Pause carousel when app goes to background
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _carouselTimer?.cancel();
    } else if (state == AppLifecycleState.resumed) {
      _startCarousel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.sliderList.length,
              onPageChanged: (currentPage) {
                _page = currentPage;
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // TODO: perform the action needed when item is tapped
                    },
                    child: SizedBox(
                      child: LayoutBuilder(builder: (context, constraint) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: CacheImage(
                            imageUrl: ApiEndpoint.imageBaseUrl +
                                (widget.sliderList[index].image ?? ""),
                            height: constraint.maxHeight,
                            width: constraint.maxWidth,
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          SmoothPageIndicator(
            controller: _controller,
            count: 5,
            effect: const WormEffect(
              dotColor: AppColors.primarySlate200,
              activeDotColor: AppColors.primaryColor,
              dotHeight: 4,
              dotWidth: 24,
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }
}
