import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class GlobalKeyConsts {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  // static final GlobalKey<ScaffoldState> scaffoldStateGlobal = GlobalKey<ScaffoldState>();
  static BuildContext? buildContextPayload;
}

String API_KEY = "AIzaSyBvq8L1n19MRzTEyKGK5ZAVL17P7E6gb2M";

class Validators {
  static bool validateMobileNumber(String value) {
    if (value == null || value == '') return false;
    const Pattern phonePattern = r'^[6-9]\d{2}\d{3}\d{4}$';
    final regexPhone = RegExp(phonePattern.toString());
    return regexPhone.hasMatch(value) ? true : false;
  }

  static bool validatePinCode(String value) {
    if (value == null) return false;
    const Pattern pattern = r'^[1-9][0-9]{5}$';
    final regexPhone = RegExp(pattern.toString());
    return regexPhone.hasMatch(value) ? true : false;
  }

  static bool validateFields(String value, String expPattern) {
    if (value == null) return false;
    // const String pattern = '^$expPattern';
    final regexPhone = RegExp(expPattern.toString());
    return regexPhone.hasMatch(value) ? true : false;
  }

  static bool validateEmail(String value) {
    if (value == null) return false;
    Pattern emailPattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r'{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]'
        r'{0,253}[a-zA-Z0-9])?)*$';
    final regexEmail = RegExp(emailPattern.toString());
    return regexEmail.hasMatch(value) ? true : false;
  }

  static bool validateName(String value) {
    if (value == null) return false;
    return value.isNotEmpty ? true : false;
    // Pattern namePattern = r"^[a-zA-Z_]+( [a-zA-Z_]+)*$";
    // final regexName = RegExp(namePattern.toString());
    // return regexName.hasMatch(value) ? true : false;
  }

  static bool validateComments(String value) {
    if (value == null) return false;
    return value.isNotEmpty ? true : false;
  }

  static bool validateDOB(String value) {
    if (value == null) return false;
    Pattern dobPattern =
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
    final regexDOB = RegExp(dobPattern.toString());
    return regexDOB.hasMatch(value) ? true : false;
  }
}
