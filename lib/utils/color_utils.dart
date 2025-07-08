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
  static const Color HEADER_GREEN_DARKER = Color(0xFF198C5A);
  static const Color HEADER_GREEN_LIGHTER = Color(0xFF44D191);
  static const Color HEADER_GREEN_TRANSPARENT_50 = Color(0x8022B573);

  static const Color BRAND_COLOR = Color(0xFF1B136C);
  static const Color BRAND_COLOR_LIGHT= Color(0xFF78B5DF);

  static const Color WHITE_CREAM_COLOR = Color(0xFFEBEBDF);
  static Color BRAND_COLOR_INACTIVE = Color(0xFF7D7AA1); // Less vibrant version
  static Color BRAND_COLOR_LIGHT_2 = Color(0xFF4E458F); // Slightly brighter version
  static Color BRAND_COLOR_DISABLED = Color(0xFFAAA6C2); // Muted, greyish version


  static const Color LIGHT_BLUE_SHADE = Color(0xFFEDF4F1);

  static const Color ORANGE_COLOR = Color(0xFFfe5d37);
  static const Color ORANGE_COLOR_LIGHT = Color(0xFFffe9e4);
  static const Color ORANGE_COLOR_DARK = Color(0xFFCC4A2B);
  static const Color ORANGE_COLOR_LIGHT_2 = Color(0xFFFF987A);
  static const Color ORANGE_COLOR_DISABLED = Color(0xFFD9A195);
  static const Color ORANGE_COLOR_TRANSPARENT = Color(0x80FE5D37);
  static const Color ORANGE_COLOR_2 = Color(0xFFF59E0B);



  static const Color PURPLE_BRAND = Color(0xFF786acf);
  static const Color PURPLE_BRAND_LIGHT = Color(0xFFedeaff);


  static const Color YELLOW_BRAND = Color(0xFFfec624);

  static const Color YELLOW_BRAND_LIGHT = Color(0xFFfff3d8);
  static const Color PURPLE_BRAND_DARK = Color(0xFF5E52A6);
  static const Color PURPLE_BRAND_LIGHT_2 = Color(0xFF9C91E5);
  static const Color PURPLE_BRAND_DISABLED = Color(0xFFB5B0D9);
  static const Color PURPLE_BRAND_TRANSPARENT = Color(0x80786ACF);


  static const Color YELLOW_BRAND_DARK = Color(0xFFE0AE1F);
  static const Color YELLOW_BRAND_LIGHT_2 = Color(0xFFFFE380);
  static const Color YELLOW_BRAND_DISABLED = Color(0xFFD1B469);
  static const Color YELLOW_BRAND_TRANSPARENT = Color(0x80FEC624);

  static const Color GREY_COLOR = Color(0xFF666666);
  static const Color TRACK_GREY = Color(0xFFD9D9D9);
  static const Color TRACK_GREY_LIGHT = Color(0xFFF8F8F8);

  static const Color GREY_COLOR_PLACEHOLDER = Color(0xFF878787);
  static const Color GREY_DOTTED = Color(0xFFEAE8E8);
  static const Color ERROR_RED = Color(0xFFDE4841);
  static const Color SECONDARY_BLACK = Color(0xFF2C2E35);
  static const WHITE_COLOR_BACKGROUND = Color(0xFFFFFFFF);
  static const Color BACKGROUND_COLOR = Color(0xFFF9FAFB);


}

class TextStyleUtils {

  static TextStyle heading1 = TextStyle(
  color: ColorUtils.BRAND_COLOR, // ✅ Keep Deep Purple for Strongest Impact
  fontSize: TextSizeDynamicUtils.dHeight38,
  fontWeight: FontWeight.w800,
  fontFamily: "Inter",
  letterSpacing: 1.2,
  );



  static TextStyle heading2 = TextStyle(
  color: ColorUtils.BRAND_COLOR, // ✅ Consistent with Heading 1
  fontSize: TextSizeDynamicUtils.dHeight36,
  fontWeight: FontWeight.w600,
    fontFamily: "Inter",

    letterSpacing: 1.0,
  );

  static TextStyle heading3 = TextStyle(
  color: ColorUtils.BRAND_COLOR, // 🔄 Change to Green for Contrast
  fontSize: TextSizeDynamicUtils.dHeight30,
  fontWeight: FontWeight.w600,
    fontFamily: "Inter",

    letterSpacing: 0.8,
  );

  static TextStyle mobileheading3 = TextStyle(
    color: ColorUtils.HEADER_GREEN, // 🔄 Change to Green for Contrast
    fontSize: TextSizeDynamicUtils.dHeight24,
    fontWeight: FontWeight.w600,
    fontFamily: "Inter",

  );

  static TextStyle heading4 = TextStyle(
  color: ColorUtils.PURPLE_BRAND_DARK, // 🔄 Slightly Dark Purple for a Softer Look
  fontSize: TextSizeDynamicUtils.dHeight28,
  fontWeight: FontWeight.w500,
    fontFamily: "Inter",

    letterSpacing: 0.5,
  );

  static TextStyle mobileheading4 = TextStyle(
    color: ColorUtils.PURPLE_BRAND_DARK, // 🔄 Slightly Dark Purple for a Softer Look
    fontSize: TextSizeDynamicUtils.dHeight20,
    fontWeight: FontWeight.w500,
    fontFamily: "Inter",

  );

  static TextStyle buttonText =
  TextStyle(
    color: ColorUtils.WHITE_COLOR_BACKGROUND, // 🔄 Slightly Dark Purple for a Softer Look
    fontSize: TextSizeDynamicUtils.dHeight16,
    fontWeight: FontWeight.w500,
    fontFamily: "Inter",

  );

  static TextStyle paragraphMain = TextStyle(
  color: ColorUtils.SECONDARY_BLACK, // ✅ Keep Black for Readability
  fontSize: TextSizeDynamicUtils.dHeight20,
  fontWeight: FontWeight.w300,
  letterSpacing: 0.5,
  );

  static TextStyle subHeading1 = TextStyle(
  color: ColorUtils.BRAND_COLOR_LIGHT_2, // 🔄 Slightly Vibrant for Subtle Highlights
  fontSize: TextSizeDynamicUtils.dHeight28,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.8,
  );

  static TextStyle paragraphSmall = TextStyle(
  color: ColorUtils.SECONDARY_BLACK, // ✅ Keep Grey for Soft Reading Sections
  fontSize: TextSizeDynamicUtils.dHeight16,
  fontWeight: FontWeight.w300,
  letterSpacing: 0.4,
  );

  static TextStyle phoneparagraphSmall = TextStyle(
    color: ColorUtils.GREY_COLOR, // ✅ Keep Grey for Soft Reading Sections
    fontSize:15,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.4,
  );

  static TextStyle phoneparagraphSmaller = TextStyle(
    color: ColorUtils.GREY_COLOR, // ✅ Keep Grey for Soft Reading Sections
    fontSize:12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.4,
  );
  static TextStyle footerText = TextStyle(
  color: ColorUtils.GREY_COLOR_PLACEHOLDER, // ✅ Light Grey for Footer Readability
  fontSize: TextSizeDynamicUtils.dHeight16,
  fontWeight: FontWeight.w400,
  );



  static TextStyle heading5 = TextStyle(
  color: ColorUtils.SECONDARY_BLACK,
  fontSize: TextSizeDynamicUtils.dHeight18,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.5,
    fontFamily: "Inter",

  );

  static TextStyle mobileheading5 = TextStyle(
    color: ColorUtils.SECONDARY_BLACK,
    fontSize: TextSizeDynamicUtils.dHeight16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    fontFamily: "Inter",

  );

  static TextStyle heading6 = TextStyle(
    color: ColorUtils.SECONDARY_BLACK,
    fontSize: TextSizeDynamicUtils.dHeight16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    fontFamily: "Inter",

  );

  static TextStyle mobileheading6 = TextStyle(
    color: ColorUtils.SECONDARY_BLACK,
    fontSize: TextSizeDynamicUtils.dHeight14,
    fontWeight: FontWeight.w600,
    fontFamily: "Inter",

  );
  // **Subheadings**


  static TextStyle subHeading2 = TextStyle(
  color: ColorUtils.PURPLE_BRAND,
  fontSize: TextSizeDynamicUtils.dHeight24,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.7,
  );

  static TextStyle subHeading3 = TextStyle(
  color: ColorUtils.BRAND_COLOR_LIGHT_2,
  fontSize: TextSizeDynamicUtils.dHeight20,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.7,
  );

  static TextStyle mobilesubHeading3 = TextStyle(
    color: ColorUtils.BRAND_COLOR_LIGHT_2,
    fontSize: TextSizeDynamicUtils.dHeight16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.7,
  );



  static TextStyle greyPlaceholder = TextStyle(
  color: ColorUtils.GREY_COLOR_PLACEHOLDER,
  fontSize: TextSizeDynamicUtils.dHeight16,
  fontWeight: FontWeight.w400,
  );

  // **Buttons & CTA**
  static TextStyle ctaButton = TextStyle(
  color: ColorUtils.WHITE_COLOR_BACKGROUND,
  fontSize: TextSizeDynamicUtils.dHeight18,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.6,
  );

  static TextStyle disabledButton = TextStyle(
  color: ColorUtils.BRAND_COLOR_DISABLED,
  fontSize: TextSizeDynamicUtils.dHeight18,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.6,
  );

  static TextStyle smallHighlighted = TextStyle(
  color: ColorUtils.GREY_COLOR_PLACEHOLDER,
  fontSize: TextSizeDynamicUtils.dHeight12,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.5,
  );



  // static TextStyle textStyleHeader1 = TextStyleUtils(
  //   fontWeight: FontWeight.w600,
  //   fontSize: TextSizeDynamicUtils.dHeight20,
  //
  //   letterSpacing: 0.5,
  //
  // );
  // static TextStyle textStyleSubHeader1 = TextStyle(
  //   color: ColorUtils.SECONDARY_BLACK,
  //   fontWeight: FontWeight.w200,
  //   fontSize: TextSizeDynamicUtils.dHeight20,
  //   letterSpacing: 0.5,
  // );


  static TextStyle footerHeaderText =TextStyle(
  fontWeight: FontWeight.w700, // Bolder for emphasis
  fontSize: TextSizeDynamicUtils.dHeight20,
  color: Colors.white,
    fontFamily: "Inter",

  );


  static TextStyle textStyleh16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: TextSizeDynamicUtils.dHeight16,
    color: Colors.white.withOpacity(0.9), // Slightly faded for contrast

  );
  static TextStyle textStyleh14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: TextSizeDynamicUtils.dHeight14,
    color: Colors.white.withOpacity(0.9), // Slightly faded for contrast

  );

  static TextStyle textStyleh16GREEN = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: TextSizeDynamicUtils.dHeight16,
    color: ColorUtils.HEADER_GREEN, // Slightly faded for contrast

  );

  static TextStyle textStyleh16BRAND= TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight16,
    color: ColorUtils.BRAND_COLOR, // Slightly faded for contrast

  );

  // static TextStyle textStyleHeaderMaininPara = TextStyle(
  //   color: ColorUtils.SECONDARY_BLACK,
  //   fontWeight: FontWeight.w200,
  //   fontSize: TextSizeDynamicUtils.dHeight18,
  //   letterSpacing: 0.5,
  // );

  // static TextStyle TextStyletextStyleSubHeader1Brand = TextStyle(
  //   color: ColorUtils.BRAND_COLOR,
  //   fontWeight: FontWeight.w600,
  //   fontSize: TextSizeDynamicUtils.dHeight38,
  //   letterSpacing: 0.5,
  // );
  // static TextStyle textStyleHeaderMain = TextStyle(
  //     fontWeight: FontWeight.w400,
  //     fontSize: TextSizeDynamicUtils.dHeight40,
  //     letterSpacing: 1.0,
  //
  // );


  // static TextStyle textStyleSubHeaderMainBold = TextStyle(
  //   fontWeight: FontWeight.w600,
  //   fontSize: TextSizeDynamicUtils.dHeight38,
  //   letterSpacing: 1.0,
  //
  // );


  // static TextStyle textStyleHeaderMainBold = TextStyle(
  //     fontWeight: FontWeight.w800,
  //     fontSize: TextSizeDynamicUtils.dHeight40,
  //     letterSpacing: 1.0,
  //   color: ColorUtils.BRAND_COLOR
  //
  // );

  static TextStyle smallGreyTextStyle = TextStyle(
    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
    fontWeight: FontWeight.w400,
    fontSize: TextSizeDynamicUtils.dHeight14,
    // letterSpacing: 0.5,
  );

  static TextStyle smallGreyTextStyleHighlighted = TextStyle(
    color: ColorUtils.GREY_COLOR_PLACEHOLDER,
    fontWeight: FontWeight.w600,
    fontSize: TextSizeDynamicUtils.dHeight12,
    letterSpacing: 0.5,
  );


}

class TextSizeDynamicUtils {
  static var height = MediaQuery.of(Get.context!).size.height;

  static get dHeight30 {
    return math.min(height * 0.04, 30.0);
  }

  static get dHeight28 {
    return math.min(height * 0.038, 28.0);
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

  static get dHeight36 {
    return math.min(height * 0.048, 36.0);
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
