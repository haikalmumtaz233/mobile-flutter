import 'package:flutter/material.dart';

class HarakaColors {
  static const Color black = Color(0xff2D3D49);
  static const Color red = Color(0xffD3546E);
  static const Color grey = Color.fromARGB(255, 196, 203, 209);
  static const Color greyStroke = Color(0xffBCC7CF);
  static const Color primary = Color.fromARGB(255, 20, 30, 70);
  static const Color lightPrimary = Color.fromARGB(255, 22, 121, 171);
  static const Color secondary = Color.fromARGB(255, 7, 65, 115);
  static const Color shadow = Color.fromARGB(255, 168, 178, 195);
}

class HarakaFonts extends HarakaColors {
  late BuildContext context;
  late TextStyle appbarTitle;
  late TextStyle actionText;
  late TextStyle hintTextField;
  late TextStyle textField;
  late TextStyle labelTextField;
  late TextStyle textButton;

  TextStyle boldInter({
    double size = 30,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'InterBold',
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? HarakaColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle semiBoldInter({
    double size = 28,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'InterSemiBold',
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? HarakaColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle regularInter({
    double size = 22,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'InterRegular',
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? HarakaColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle lightInter({
    double size = 15,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'InterLight',
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? HarakaColors.black,
      letterSpacing: letterSpacing,
    );
  }

  TextStyle mediumInter({
    double size = 14,
    Color? color,
    double? height,
    double? letterSpacing,
    bool italic = false,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'InterMedium',
      fontSize: size,
      fontWeight: fontWeight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? HarakaColors.black,
      letterSpacing: letterSpacing,
    );
  }

  HarakaFonts(this.context) {
    appbarTitle = const TextStyle(
      color: HarakaColors.primary,
      fontFamily: 'InterBold',
      fontSize: 18,
    );

    textButton = const TextStyle(
      color: HarakaColors.primary,
      fontFamily: 'PMedium',
      fontSize: 16,
    );

    actionText = const TextStyle(
      color: HarakaColors.primary,
      fontFamily: 'QuicksandLight',
      fontSize: 15,
    );

    hintTextField = const TextStyle(
      color: HarakaColors.grey,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      fontFamily: 'QuicksandRegular',
    );

    labelTextField = const TextStyle(
      color: HarakaColors.black,
      fontFamily: 'QuicksandMedium',
      fontSize: 15,
    );

    textField = const TextStyle(
      color: HarakaColors.black,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    );
  }
}
