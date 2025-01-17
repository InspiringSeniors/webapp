import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../color_utils.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: MaterialColorCustom.primaryBlue,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    useMaterial3: false,
    // inputDecorationTheme: inputDecorationTheme()
  );
}

TextTheme textTheme() {
  if (Get.locale?.languageCode == "en_US") {
    return const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontFamily: 'NotoSans'),
      bodyMedium: TextStyle(color: Colors.black, fontFamily: 'NotoSans'),
    );
  } else {
    // return TextTheme(
    //   bodyText1: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
    //   bodyText2: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
    // );
    return const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontFamily: 'NotoSans'),
      bodyMedium: TextStyle(color: Colors.black, fontFamily: 'NotoSans'),
    );
  }
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: ColorUtils.WHITE_COLOR_BACKGROUND,
      elevation: 2,
      systemOverlayStyle: SystemUiOverlayStyle.light);
}
