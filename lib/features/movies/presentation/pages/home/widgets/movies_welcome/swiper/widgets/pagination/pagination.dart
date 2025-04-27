import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

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
