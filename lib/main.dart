import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/modules/homepage_screen/controllers/homepage_controller.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'myApp.dart';
import 'utils/services/scroll_service.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy()); // 👈 Add this line to enable clean URLs

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      authDomain: "inspiringseniorswebapp.firebaseapp.com",
      apiKey: "AIzaSyAyTnVnovPifgT11FE3oC2GeeYT2bd4Dng",
      projectId: "inspiringseniorswebapp",
      messagingSenderId: "457143288541",
      storageBucket: "inspiringseniorswebapp.firebasestorage.app",
      appId: "1:457143288541:web:f3979818d0688a59bcd134",
        measurementId: "G-S64FEM786G"
    ),
  );


  Get.put(AuthService());
  Get.put(UserAuthService());
  Get.lazyPut(() => HomepageController(), fenix: true);

  Get.locale= Locale("en_US");
  Get.put(ScrollService());


  runApp(

     const MyApp(
  ));
}
