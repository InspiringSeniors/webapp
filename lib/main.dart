import 'package:flutter/material.dart';
import 'package:inspiringseniorswebapp/utils/routes/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    initialRoute: RoutingNames.SPLASH_SCREEN,
  ));
}
