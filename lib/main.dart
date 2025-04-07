import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/utils/middlewares/auth_middle_ware.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "inspiringwebapp",

    options: FirebaseOptions(



      apiKey: "AIzaSyAyTnVnovPifgT11FE3oC2GeeYT2bd4Dng",
        projectId: "inspiringseniorswebapp",
        messagingSenderId: "457143288541",
        appId: "1:457143288541:web:f3979818d0688a59bcd134",
    )

  );

  Get.put(AuthService());
  runApp(

     const MyApp(
  ));
}
