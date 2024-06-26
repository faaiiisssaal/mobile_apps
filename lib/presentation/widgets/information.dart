import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:healthcareapp/common/constant.dart';


class ImageSlideShow {
  Widget build(BuildContext context) {
    return ImageSlideshow(
      height: 200,
      indicatorColor: kSeaBlue,
      onPageChanged: (value) {
        debugPrint('Page changed: $value');
      },
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        Image.asset(
          'asset/whatsapp-logo.png',
          fit: BoxFit.fitHeight,
        ),
        Image.asset(
          'asset/apple-logo.png',
          fit: BoxFit.fitHeight,
        ),
        Image.asset(
          'asset/google-logo.png',
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}