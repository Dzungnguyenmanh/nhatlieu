import 'package:flutter/material.dart';
import 'package:nhatlieu/presentation/login/login_screen.dart';
import 'package:nhatlieu/presentation/splash/splash_screen.dart';
import 'package:nhatlieu/presentation/started/started_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String startedScreen = '/started_screen';
    static const String loginScreen= '/login_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        startedScreen: StartedScreen.builder,
        loginScreen: LoginScreen.builder,
        initialRoute: SplashScreen.builder,
      };
}