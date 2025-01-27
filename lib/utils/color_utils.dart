import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class MaterialColorCustom {
  static const int _blueThemeValue = 0xFF67E2EF;
  static MaterialColor primaryBlue = const MaterialColor(
    _blueThemeValue,
    <int, Color>{
      50: Color(0xFF0054A6),
      100: Color(0xFF0054A6),
      200: Color(0xFF0054A6),
      300: Color(0xFF0054A6),
      400: Color(0xFF0054A6),
      500: Color(_blueThemeValue),
      600: Color(0xFF0054A6),
      700: Color(0xFF0054A6),
      800: Color(0xFF0054A6),
      900: Color(0xFF0054A6),
    },
  );
}

class ColorUtils {
  static const Color HEADER_GREEN = Color(0xFF22B573);
  static const Color BRAND_COLOR = Color(0xFF1B136C);

  static const Color WHITE_CREAM_COLOR = Color(0xFFEBEBDF);

  static const Color BRAND_COLOR_INACTIVE = Color(0xFF7D7AA1);

  static const Color BRAND_COLOR_LIGHT = Color(0xFFADD5F6);
  static const Color LIGHT_BLUE_SHADE = Color(0xFFEDF4F1);

  static const Color ORANGE_COLOR = Color(0xFFfe5d37);
  static const Color ORANGE_COLOR_LIGHT = Color(0xFFffe9e4);

  static const Color PURPLE_BRAND = Color(0xFF786acf);
  static const Color PURPLE_BRAND_LIGHT = Color(0xFFedeaff);

  static const Color YELLOW_BRAND = Color(0xFFfec624);

  static const Color YELLOW_BRAND_LIGHT = Color(0xFFfff3d8);


  static const Color GREY_COLOR = Color(0xFF666666);
  static const Color TRACK_GREY = Color(0xFFD9D9D9);
  static const Color TRACK_GREY_LIGHT = Color(0xFFF8F8F8);

  static const Color GREY_COLOR_PLACEHOLDER = Color(0xFF878787);
  static const Color GREY_DOTTED = Color(0xFFC5C5C5);
  static const Color ERROR_RED = Color(0xFFDE4841);
  static const Color SECONDARY_BLACK = Color(0xFF2C2E35);
  static const WHITE_COLOR_BACKGROUND = Color(0xFFFFFFFF);
}

class TextStyleUtils {
  static TextStyle textStyleHeader1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight16,
    letterSpacing: 0.5,

  );
  static TextStyle textStyleSubHeader1 = TextStyle(
    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight14,
    letterSpacing: 0.5,
  );
  static TextStyle textStyleSubHeader1Black = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight14,
    letterSpacing: 0.5,
  );

  static TextStyle textStyleSubHeader1Brand = TextStyle(
    color: ColorUtils.BRAND_COLOR,
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight38,
    letterSpacing: 0.5,
    fontFamily: "Montserrat"
  );
  static TextStyle textStyleHeaderMain = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: TextSizeDynamicUtils.dHeight24,
      letterSpacing: 1.0,
      fontFamily: "Poppins");

  static TextStyle simpleBlackTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: TextSizeDynamicUtils.dHeight14,
    // letterSpacing: 0.5,
  );
  static TextStyle simpleBlackTextStyle12 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: TextSizeDynamicUtils.dHeight12,
    letterSpacing: 0.5,
  );
  static TextStyle simpleBlackTextStyleHighlighted = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight12,
    letterSpacing: 0.5,
  );
  static TextStyle smallGreyTextStyle = TextStyle(
    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
    fontWeight: FontWeight.w400,
    fontSize: TextSizeDynamicUtils.dHeight12,
    // letterSpacing: 0.5,
  );

  static TextStyle smallGreyTextStyleHighlighted = TextStyle(
    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight12,
    letterSpacing: 0.5,
  );

  static TextStyle textHeadingSimpleBlack_24_700 = TextStyle(
      color: ColorUtils.SECONDARY_BLACK,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.015,
      fontFamily: "Poppins-medium");

  static TextStyle textHeadingBoldBlack_18_700 = TextStyle(
      color: ColorUtils.SECONDARY_BLACK,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
      fontFamily: "Poppins-medium");

  static TextStyle textHeaderBlack_18_500 = TextStyle(
      color: ColorUtils.SECONDARY_BLACK,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-medium");

  static TextStyle textSubHeadingBlack_16_600 = TextStyle(
      color: ColorUtils.SECONDARY_BLACK,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins-medium");
  static TextStyle textSimpleBlack_16_400 = TextStyle(
      color: ColorUtils.SECONDARY_BLACK,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins-medium");

  static TextStyle textSimpleGrey_14_400 = TextStyle(
      color: ColorUtils.GREY_COLOR_PLACEHOLDER,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins-medium");
  static TextStyle textSimpleHaldBoldBlack_16_500 = TextStyle(
      color: ColorUtils.SECONDARY_BLACK,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-medium");

  static TextStyle textBlackTabs_14_500 = TextStyle(
      color: ColorUtils.SECONDARY_BLACK,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-medium");

  static TextStyle textTabsBrandGreen_14_500 = TextStyle(
      color: ColorUtils.BRAND_COLOR,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-medium");

  static TextStyle textTabsErrorReded_14_500 = TextStyle(
      color: ColorUtils.ERROR_RED,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-medium");

  static TextStyle textNavigtaionButtonWhite_14_500 = TextStyle(
      color: ColorUtils.WHITE_COLOR_BACKGROUND,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-medium");

  static TextStyle textBlackSmall_12_500 = TextStyle(
      color: ColorUtils.BRAND_COLOR,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-medium");
}

class TextSizeDynamicUtils {
  static var height = MediaQuery.of(Get.context!).size.height;

  static get dHeight30 {
    return math.min(height * 0.032, 30.0);
  }

  static get dHeight28 {
    return math.min(height * 0.04, 28.0);
  }

  static get dHeight22 {
    return math.min(height * 0.032, 22.0);
  }

  static get dHeight16 {
    return math.min(height * 0.023, 16.0);
  }

  static get dHeight38 {
    return math.min(height * 0.056, 38.0);
  }

  static get dHeight24 {
    return math.min(height * 0.035, 24.0);
  }

  static get dHeight14 {
    return math.min(height * 0.020, 14.0);
  }

  static get dHeight40 {
    return math.min(height * 0.059, 40.0);
  }

  static get dHeight18 {
    return math.min(height * 0.026, 18.0);
  }

  static get dHeight100 {
    return math.min(height * 0.13, 100.0);
  }

  static get dHeight85 {
    return math.min(height * 0.11, 85.0);
  }

  static get dHeight20 {
    return math.min(height * 0.029, 20.0);
  }

  static get dHeight10 {
    return math.min(height * 0.014, 10.0);
  }

  static get dHeight42 {
    return math.min(height * 0.062, 42.0);
  }

  static get dHeight32 {
    return math.min(height * 0.047, 32.0);
  }

  static get dHeight48 {
    return math.min(height * 0.071, 48.0);
  }

  static get dHeight52 {
    return math.min(height * 0.073, 52.0);
  }

  static get dHeight12 {
    return math.min(height * 0.0179, 12.0);
  }

  static get dHeight56 {
    return math.min(height * 0.083, 56.0);
  }
}
