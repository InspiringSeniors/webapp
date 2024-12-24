import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:inspiringseniorswebapp/utils/themes/theme_data.dart';
import 'package:inspiringseniorswebapp/utils/translations/translations_locale.dart';
import 'package:inspiringseniorswebapp/utils/utility/utils.dart';

import 'modules/homepage_screen/controllers/homepage_bindings.dart';
import 'modules/homepage_screen/views/homepage_screen.dart';
import 'modules/splash_screen/controller/initial_binding.dart';
import 'modules/splash_screen/controller/splash_screen_binding.dart';
import 'modules/splash_screen/views/splashscreen.dart';


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
                      name: RoutingNames.HOME_PAGE_SCREEN,
                      page: () => HomepageScreen(),
                      binding: HomepageBindings()),
                ]));
  }
}
