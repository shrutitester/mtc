import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../constants/colorConstants.dart';
import '../constants/stringConstants.dart';


class LotOfThemes {
  static final dark14 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.txtColorDark,
          fontWeight: FontWeight.w400,
          fontSize: 14));

  static textBold(Color color, double size) => GoogleFonts.rubik(
      color: color, fontWeight: FontWeight.w500, fontSize: size);

  static heightMargin(double height) => SizedBox(
        height: height,
      );

  static widthMargin(double width) => SizedBox(
        height: width,
      );

  static googleFont({style}) => GoogleFonts.robotoMono(
        textStyle: style,
      );

  static final googleFontHeading4 = GoogleFonts.robotoMono(
    textStyle: heading4,
  );

  static final googleFontTxt14DarkBold = GoogleFonts.robotoMono(
    textStyle: txt14DarkBold,
  );

  static const heading1 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w800,
      fontSize: 28);

  static const heading2 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w800,
      fontSize: 22);

  static const heading3 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 18);

  static const heading4 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14);

  static final editHeading = TextStyle(
    color: ColorConstants.textDark,
    fontWeight: FontWeight.w600,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14,
  );

  static title(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w400,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 25,
      );

  static subtitle(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w400,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 12,
      );

  static txt14(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w400,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 14,
      );

  static txt16(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w700,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 16,
      );

  static final txt14GreenBold = TextStyle(
    color: ColorConstants.green,
    fontWeight: FontWeight.w700,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 15,
  );

  static const txt14DarkBold = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 15,
  );

  static const txt14BlueBold = TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 15,
  );

  static final txt14DarkSmall = TextStyle(
    color: ColorConstants.txtColorDark,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 11,
  );
  static final txt14WhiteSmall = TextStyle(
    color: ColorConstants.white,
    // fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 12,
  );
  static final txt14Dark = TextStyle(
    color: ColorConstants.txtColorDark,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14,
  );

  static final txt14Light = TextStyle(
    color: ColorConstants.txtColorLight,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 10,
  );
  static const txt14primary = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14,
  );
  static final txt14Yellow = TextStyle(
    color: ColorConstants.yellowColor,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14,
  );

  static final editHint = TextStyle(
    color: ColorConstants.txtColorDark,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14,
  );

  static final text16Heading = TextStyle(
    color: ColorConstants.textDark,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 16,
  );

  static final text16HeadingBlue = TextStyle(
    color: ColorConstants.txtColorDark,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 16,
  );

  static const text16HeadingRed = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14,
  );

  static const textHeading14 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14,
  );
  static const textText12 = TextStyle(
      fontWeight: FontWeight.w300,
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontSize: 12);

  static final light14 = GoogleFonts.rubik(
      textStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14));

  static final black12 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 12));

  static final grey12 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.valueColor,
          fontWeight: FontWeight.w400,
          fontSize: 12));

  static smallHeading1(String value) => Text(value, style: black12);
  static smallTxt1(String value) => Text(value, style: grey12);

}
