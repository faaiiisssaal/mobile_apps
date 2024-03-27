import 'package:flutter/material.dart';

// Color code

const kPureWhite      = Color(0xFFffffff);
const kPureBlack      = Color(0xFF000000);
const kPureRed        = Color(0xFFFF0000);
const kPureGreen      = Color(0xFF00FF00);
const kPureBlue       = Color(0xFF0000FF);

const kBlack          = Color(0XFF1e1e1e);

const kDarkWhite      = Color(0xFFE1D9D1);
const kLightBlack     = Color(0xFF454545);

const kDarkBlue       = Color(0xFF00008b);
const kSeaBlue        = Color(0xFF006994);
const kSkyBlue        = Color(0xFF87CEEB);
// const kLightBlue      = Color(0xFFADD8E6);
const kSapphireBlue   = Color(0XFF0F52BA);
const kBabyBlue       = Color(0XFF89CFF0);

const kLightRed       = Color(0xFFFF7F7F);
const kDarkRed        = Color(0xFF8B0000);

const kLightGrey      = Color(0xFFD3D3D3);
const kDarkGrey       = Color(0xFFA9a9a9);

// Divider

const hp10 = SizedBox(
  height: 10,
);
const wp10 = SizedBox(
  width: 10,
);

const hp20 = SizedBox(
  height: 20,
);
const wp20 = SizedBox(
  width: 20,
);

const spc = Spacer();

// Padding and Margin

// All
EdgeInsetsGeometry paddingall(double all) {
  return EdgeInsets.all(all);
}

EdgeInsetsGeometry marginall(double all) {
  return EdgeInsets.all(all);
}
// All

// Symmetrics
EdgeInsetsGeometry vertical(double symmetrics) {
  return EdgeInsets.symmetric(vertical: symmetrics);
}

EdgeInsetsGeometry horizontal(double symmetrics) {
  return EdgeInsets.symmetric(horizontal: symmetrics);
}

EdgeInsetsGeometry horiverti(double sym1, double sym2) {
  return EdgeInsets.symmetric(horizontal: sym1, vertical: sym2);
}
// Symmetrics

// One padding/margin
EdgeInsetsGeometry onlyleft(double left) {
  return EdgeInsets.only(left: left);
}

EdgeInsetsGeometry onlyright(double right) {
  return EdgeInsets.only(right: right);
}

EdgeInsetsGeometry onlytop(double top) {
  return EdgeInsets.only(top: top);
}

EdgeInsetsGeometry onlybottom(double bottom) {
  return EdgeInsets.only(bottom: bottom);
}
// One padding/margin

// 2 padding/margin
EdgeInsetsGeometry leftbottom(double left, double bottom) {
  return EdgeInsets.only(left: left, bottom: bottom);
}

EdgeInsetsGeometry rightbottom(double right, double bottom) {
  return EdgeInsets.only(right: right, bottom: bottom);
}

EdgeInsetsGeometry lefttop(double left, double top) {
  return EdgeInsets.only(left: left, top: top);
}

EdgeInsetsGeometry righttop(double right, double top) {
  return EdgeInsets.only(right: right, top: top);
}
// 2 padding/margin

// 3 margin/padding
EdgeInsetsGeometry topleftright(double top, double left, double right) {
  return EdgeInsets.only(top: top, left: left, right: right);
}

EdgeInsetsGeometry bottomleftright(double bottom, double left, double right) {
  return EdgeInsets.only(bottom: bottom, left: left, right: right);
}

EdgeInsetsGeometry topbottomleft(double top, double bottom, double left) {
  return EdgeInsets.only(top: top, bottom: bottom, left: left);
}

EdgeInsetsGeometry topbottomright(double top, double bottom, double right) {
  return EdgeInsets.only(top: top, bottom: bottom, right: right);
}
// 3 margin/padding

EdgeInsetsGeometry topbottomrightleft(double top, double bottom, double right, double left) {
  return EdgeInsets.only(top: top, bottom: bottom, right: right, left: left);
}

// Widget Size
double mediaheight(double height, BuildContext context) {
  return MediaQuery.of(context).size.height * height;
}

double mediawidth(double width, BuildContext context) {
  return MediaQuery.of(context).size.width * width;
}

// Radius
const BorderRadius r15 = BorderRadius.all(Radius.circular(15.0));

const BorderRadius r10 = BorderRadius.all(Radius.circular(10.0));

const BorderRadius r25 = BorderRadius.all(Radius.circular(25.0));

const BorderRadius r20 = BorderRadius.all(Radius.circular(20.0));








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
