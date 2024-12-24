import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/splash_screen/controller/splash-screen_repo_impl.dart';
import 'package:inspiringseniorswebapp/modules/splash_screen/controller/splash_screen_repo.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/routes/routes.dart';

class SplashScreenController extends GetxController {
  SplashScreenRepo? splashScreenRepo;
  var isUserLoggedIn;
  String myappverison = "";
  bool firstTime = false;
  bool firstTimeOnboarding = false;
  var hasDocs = false;

  @override
  void onInit() async {
    splashScreenRepo = Get.put(SplashScreenRepoImpl());

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    myappverison = packageInfo.version;
    String code = packageInfo.buildNumber;

    print("locale in splash ${Get.locale}");
    if (kDebugMode) {
      print("printing version number $myappverison");
    }

    var prefs = await SharedPreferences.getInstance();

    try{
      String savedLocaleString=prefs.getString("savedLocale")!;
      Locale savedLocale= new Locale(savedLocaleString);
      Get.updateLocale(savedLocale);
    }catch(e){

    }
    try {
      isUserLoggedIn = prefs.getBool("IsUserLoggedIn");
    } catch (e) {
      isUserLoggedIn = false;
    }
    try {
      print('in try checking for first time sps');
      print('Before sps$firstTime');
      firstTime = prefs.getBool('FirstTime')!;
    } catch (e) {
      firstTime = true;
    }
    try {
      firstTimeOnboarding = prefs.getBool("FirstTimeOnboarding")!;
    } catch (e) {
      firstTimeOnboarding = true;
    }
    startTime();
    super.onInit();
  }

  void navigateToOtherScreen() async {
    if (kDebugMode) {
      print("trying to navigate to other screen");
    }


    Get.toNamed(RoutingNames.HOME_PAGE_SCREEN);
    // if (firstTime == true) {
    //   Get.offAllNamed(RoutingNames.FIRST_TIME_LANGUAGE_SCREEN);
    // } else {
    //   print("${isUserLoggedIn} checking user logged in");
    //   // logged in set after the user enters a valid otp for atleat one time
    //   if (isUserLoggedIn != null && isUserLoggedIn == true) {
    //     await checkForUserRegistration();
    //
    //     print("has docs value is ${hasDocs}");
    //     // from firebase firestore uid and data retrieval
    //     if (hasDocs == false) {
    //       // to be added code
    //       Get.offAllNamed(RoutingNames.SIGNUP_SCREEN);
    //     } else {
    //       Get.offAllNamed(RoutingNames.HOME_PAGE_SCREEN);
    //     }
    //   } else {
    //     Get.offAllNamed(RoutingNames.LOGIN_SCREEN);
    //   }
    // }
  }

  startTime() async {
    var duration = const Duration(milliseconds: 1500);
    return Timer(duration, navigateToOtherScreen);
  }

  bool isVersionGreaterThan(String newVersion, String currentVersion) {
    List<String> currentV = currentVersion.split(".");
    List<String> newV = newVersion.split(".");
    bool a = false;
    for (var i = 0; i <= 2; i++) {
      a = int.parse(newV[i]) > int.parse(currentV[i]);
      if (int.parse(newV[i]) != int.parse(currentV[i])) break;
    }
    return a;
  }

  checkForUserRegistration() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    print("current user ${user}");
    if (user != null) {
      // Reference to your Firestore database
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        print("user already exists for firestore ");
        hasDocs = true;
        // User already exists, redirect to Home Screen
      } else {
        print("user does not exists");

        hasDocs = false;
        // User is new, redirect to Sign-Up Screen
      }
    }
  }
}
