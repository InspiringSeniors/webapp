import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/google_form_screen/views/google_form_screen.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/bindings/health_hub_bindings.dart';
import 'package:inspiringseniorswebapp/modules/health_hub_main_screen/views/health_hub_main_screen.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_bindings.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/views/homepage_screen.dart';
import 'package:inspiringseniorswebapp/modules/pdf_viewer_screen/views/pdf_viewer_screen.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'modules/splash_screen/controller/initial_binding.dart';
import 'modules/splash_screen/controller/splash_screen_binding.dart';
import 'modules/splash_screen/views/splashscreen.dart';
import 'utils/themes/theme_data.dart';
import 'utils/translations/translations_locale.dart';
import 'utils/utility/utils.dart';

class MyApp extends StatefulWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKeyConsts.buildContextPayload = context;

    return ScreenUtilInit(
        // designSize: const Size(360, 690),
        builder: (BuildContext context, child) =>
            GetMaterialApp(
                unknownRoute: GetPage(
                    name: RoutingNames.SPLASH_SCREEN,
                    page: () => SplashScreen(),
                    binding: SplashScreenBinding()),
                debugShowCheckedModeBanner: false,
                builder: EasyLoading.init(),
                theme: theme(),
                navigatorKey: GlobalKeyConsts.navigatorKey,
                onGenerateRoute: (settings) {
                  if (kDebugMode) {
                    print('asdkskandas--onGenerateRoute--${settings.name}');
                  }
                  return null;
                },
                routingCallback: (routing) {
                  if (kDebugMode) {
                    print('asdkskandas--routingCallback--${routing?.current}');
                  }
                },
                initialBinding: InitialBinding(),
                initialRoute: RoutingNames.SPLASH_SCREEN,
                translationsKeys: AppTranslation.translationsKeys,
                locale: Get.locale,
                fallbackLocale: Locale('en'),

                getPages: [
                  GetPage(
                      name: RoutingNames.SPLASH_SCREEN,
                      page: () => const SplashScreen(),
                      binding: SplashScreenBinding()),

                  GetPage(
                      name: RoutingNames.HOME_PAGE_SCREEN,
                      page: () =>  HomepageScreen(),
                      binding: HomepageBindings()),

                  GetPage(
                      name: RoutingNames.HEALTH_HUB_MAIN_SCREEN,
                      page: () =>  HealthHubMainScreen(),
                      binding: HealthHubBindings()),



                  GetPage(
                      name: RoutingNames.PDF_VIEWER_SCREEN,
                      page: () =>  PdfViewerScreen(),
                      ),

                  GetPage(
                    name: RoutingNames.GOOGLE_FORM_SCREEN,
                    page: () =>  GoogleFormScreen(),
                  ),

                ]));
  }
}
