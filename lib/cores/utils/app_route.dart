import 'package:flutter/material.dart';
import 'package:nhatlieu/presentation/home/started_screen.dart';
import 'package:nhatlieu/presentation/login/login_screen.dart';
import 'package:nhatlieu/presentation/splash/splash_screen.dart';
import 'package:nhatlieu/presentation/account/add_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String HomePage = '/home';
  static const String loginScreen = '/login_screen';
  static const String initialRoute = '/initialRoute';
  static const String addScreen = '/account';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        HomePage: HomeScreen.builder,
        addScreen: AddScreen.builder,
        loginScreen: LoginScreen.builder,
        initialRoute: SplashScreen.builder,
      };
}
