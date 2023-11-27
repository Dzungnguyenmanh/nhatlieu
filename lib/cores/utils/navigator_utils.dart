import 'package:flutter/material.dart';

class NavUtils {
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) async {
    return navigatorkey.currentState?.pushNamed(routeName, arguments: args);
  }

  static void goback() {
    return navigatorkey.currentState?.pop();
  }

  static Future<dynamic> pushNameAndRemoveUtil(String routeName,
      {bool routePredicate = false, dynamic args}) async {
    return navigatorkey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: args);
  }

  static Future<dynamic> popAndPushNamed(String routeName,
      {dynamic args}) async {
    return navigatorkey.currentState
        ?.popAndPushNamed(routeName, arguments: args);
  }
}