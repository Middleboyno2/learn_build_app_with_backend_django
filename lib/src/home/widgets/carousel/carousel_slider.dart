import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../const/constants.dart';
import 'banner.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      autoPlayInterval: 5000,
      isLoop: true,
      children: List.generate(banners.length, (i){
        return BannerWidget(image: banners[i], link: "");
      }),
    );
  }
}
