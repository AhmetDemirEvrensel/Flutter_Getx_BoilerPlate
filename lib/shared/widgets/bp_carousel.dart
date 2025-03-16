import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/shared/constants/colors.dart';

class BpCarousel extends StatefulWidget {
  final List<String> imageLinks;
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool infiniteScroll;
  final bool showIndicator;
  final Color? activeIndicatorColor;
  final Color? inactiveIndicatorColor;

  const BpCarousel({
    super.key,
    required this.imageLinks,
    this.height = 200,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.infiniteScroll = true,
    this.showIndicator = true,
    this.activeIndicatorColor,
    this.inactiveIndicatorColor,
  });

  @override
  State<BpCarousel> createState() => _BpCarouselState();
}

class _BpCarouselState extends State<BpCarousel> {
  late PageController _pageController;
  late int _currentPage;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _pageController = PageController(
      initialPage: widget.infiniteScroll ? widget.imageLinks.length * 100 : 0,
      viewportFraction: 0.9,
    );
    if (widget.autoPlay) _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.autoPlayInterval, (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: widget.height,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index % widget.imageLinks.length;
                });
              },
              itemBuilder: (context, index) {
                final itemIndex = index % widget.imageLinks.length;
                final item = widget.imageLinks[itemIndex];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.network(
                      item,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          if (widget.showIndicator) ...[
            const SizedBox(height: 16),
            Container(
              height: 15,
              width: widget.imageLinks.length * 18,
              decoration: BoxDecoration(
                color: const Color(0xff161616).withOpacity(.05),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imageLinks.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: _currentPage == index ? 12 : 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: _currentPage == index
                          ? (widget.activeIndicatorColor ??
                              ColorConstants.buildingColor)
                          : (widget.inactiveIndicatorColor ?? Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 8),
          Container(
            height: 2,
            color: ColorConstants.blackLight,
          ),
        ],
      ),
    );
  }
}
