import 'package:flutter/material.dart';

// Color code

const kPureWhite = Color(0xFFffffff);
const kPureBlack = Color(0xFF000000);
const kPureRed = Color(0xFFFF0000);
const kPureGreen = Color(0xFF00FF00);
const kPureBlue = Color(0xFF0000FF);

const kDarkWhite = Color(0xFFE1D9D1);
const kLightBlack = Color(0xFF454545);

const kDarkBlue = Color(0xFF00008b);
const kSeaBlue = Color(0xFF006994);
const kSkyBlue = Color(0xFF87CEEB);
const kLightRed = Color(0xFFFF7F7F);
const kDarkRed = Color(0xFF8B0000);
const kLightGrey = Color(0xFFD3D3D3);
const kDarkGrey = Color(0xFFA9a9a9);

// Divider

const c10 = SizedBox(
  height: 10,
);
const spc = Spacer();

// Padding and Margin

// All
EdgeInsets? paddingall(double all) {
  return EdgeInsets.all(all);
}

EdgeInsets marginall(double all) {
  return EdgeInsets.all(all);
}
// All

// Symmetrics
EdgeInsets vertical(double symmetrics) {
  return EdgeInsets.symmetric(vertical: symmetrics);
}

EdgeInsets horizontal(double symmetrics) {
  return EdgeInsets.symmetric(horizontal: symmetrics);
}
// Symmetrics

// One padding/margin
EdgeInsets onlyleft(double left) {
  return EdgeInsets.only(left: left);
}

EdgeInsets onlyright(double right) {
  return EdgeInsets.only(right: right);
}

EdgeInsets onlytop(double top) {
  return EdgeInsets.only(top: top);
}

EdgeInsets onlybottom(double bottom) {
  return EdgeInsets.only(bottom: bottom);
}
// One padding/margin

// 2 padding/margin
EdgeInsets leftbottom(double left, double bottom) {
  return EdgeInsets.only(left: left, bottom: bottom);
}

EdgeInsets rightbottom(double right, double bottom) {
  return EdgeInsets.only(right: right, bottom: bottom);
}

EdgeInsets lefttop(double left, double top) {
  return EdgeInsets.only(left: left, top: top);
}

EdgeInsets righttop(double right, double top) {
  return EdgeInsets.only(right: right, top: top);
}
// 2 padding/margin

// 3 margin/padding
EdgeInsets topleftright(double top, double left, double right) {
  return EdgeInsets.only(top: top, left: left, right: right);
}

EdgeInsets bottomleftright(double bottom, double left, double right) {
  return EdgeInsets.only(bottom: bottom, left: left, right: right);
}

EdgeInsets topbottomleft(double top, double bottom, double left) {
  return EdgeInsets.only(top: top, bottom: bottom, right: left);
}

EdgeInsets topbottomright(double top, double bottom, double right) {
  return EdgeInsets.only(top: top, bottom: bottom, left: right);
}
// 3 margin/padding


// Widget Size
double mediaheight(double height, BuildContext context) {
  return MediaQuery.of(context).size.height * height;
}

double mediawidth(double width, BuildContext context) {
  return MediaQuery.of(context).size.height * width;
}

// Radius
const BorderRadius r15 = BorderRadius.all(Radius.circular(15.0));








class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}