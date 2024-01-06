import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nhatlieu/cores/utils/app_route.dart';
import 'package:nhatlieu/cores/utils/logger.dart';
import 'package:nhatlieu/cores/utils/navigator_utils.dart';
import 'package:nhatlieu/cores/utils/theme_utils.dart';

var globalMessagerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.info : LogMode.debug);
    runApp(const NhatLlieuApp());
  });
}

class NhatLlieuApp extends StatelessWidget {
  const NhatLlieuApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavUtils.navigatorkey,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: globalMessagerKey,
      title: 'Nhat Lieu Y Vien',
      theme: ThemeUtils.lightTheme,
      darkTheme: ThemeUtils.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
