import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

/// Builds and returns a customized [SwiperPagination] plugin for use with Swiper widgets.
///
/// This pagination is aligned to the bottom center with a top margin.
/// It uses a dot-style indicator, with configurable active and inactive dot sizes and colors.
///
/// Returns:
/// - A [SwiperPlugin] representing the pagination configuration.
SwiperPlugin swiperPagination() {
  return SwiperPagination(
    margin: EdgeInsets.only(top: 10.0),
    alignment: Alignment.bottomCenter,
    builder: DotSwiperPaginationBuilder(
      activeColor: Colors.white,
      color: Colors.white.withValues(alpha: 0.2),
      size: 8.0,
      activeSize: 12.0,
    ),
  );
}
