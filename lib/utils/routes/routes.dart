import 'package:get/get.dart';

import '../../modules/splash_screen/controller/splash_screen_binding.dart';
import '../../modules/splash_screen/views/splashscreen.dart';

class RoutingNames {
  static String HOME_ROUTE = "/";
  static String SPLASH_SCREEN = "/splashScreen";
  static String ONBOARDING = "/onBoarding";
  static String FIRST_TIME_LANGUAGE_SCREEN = "/firstTimeLanguageScreen";
  static String LOGIN_SCREEN = "/loginScreen";
  static String SIGNUP_SCREEN = "/signupScreen";
  static String OTP_SCREEN = "/otpScreen";

  static String FORCE_UPDATE = "/forceupdate";
  static String HOME_PAGE_SCREEN = "/homepageScreen";

  //Profile routes
  static String MY_PROFILE = "/myprofile";
  static String MY_COMMUNITY = "/mycommunity";

  static String LOGOUT = "/logout";

// static List<GetPage> getPagesRoutes = [
//   GetPage(
//       name: SPLASH_SCREEN,
//       page: () => const SplashScreen(),
//       binding: SplashScreenBinding()),
//   GetPage(
//       name: ONBOARDING,
//       page: () => OnBoardingScreen(),
//       binding: OnBoardingbinding()),
//   GetPage(
//       name: LOGIN_SCREEN,
//       page: () => LoginScreen(),
//       binding: LoginSignupBinding()),
//   GetPage(
//       name: FIRST_TIME_LANGUAGE_SCREEN,
//       page: () => FirstTimeLanguageScreen(),
//       binding: FirstTimeLanguageControllerBinding()),
// ];
}
