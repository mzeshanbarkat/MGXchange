import 'package:flutter/material.dart';


const kPrimarycolor=Color(0xff064493
);
const kPrimaryDark=Color(0xff073E85);
const FontColor=Color(0xff303030);
const IconColor=Color(0xff527DB4);


class ColorsConsts {
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color title = Color(0xDD000000);
  static Color subTitle = Color(0x8A000000);
  static Color backgroundColor = Color(0xFFE0E0E0); //grey shade 300

  static Color favColor = Color(0xFFF44336); // red 500
  static Color favBadgeColor = Color(0xFFE57373); // red 300

  static Color cartColor = Color(0xFF5E35B1); //deep purple 600
  static Color cartBadgeColor = Color(0xFFBA68C8); //purple 300

  static Color gradiendFStart = Color(0xFFE040FB); //purpleaccent 100
  static Color gradiendFEnd = Color(0xFFE1BEE7); //purple 100
  static Color endColor = Color(0xFFCE93D8); //purple 200
  static Color purple300 = Color(0xFFBA68C8); //purple 300
  static Color gradiendLEnd = Color(0xFFE91E63); //Pink
  static Color gradiendLStart = Color(0xFF9C27B0); //purple 500
  static Color starterColor = Color(0xFF8E24AA); //purple 600
  static Color purple800 = Color(0xFF6A1B9A);}

class Textt1{

  static TextStyle textStyle(Color color,double fontsize)
  {
    return TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: FontWeight.normal,
    );
  }
}


class Textt2{

  static TextStyle textStyle(Color color,double fontsize)
  {
    return TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.bold
    );
  }
}
