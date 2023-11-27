import 'package:flutter/material.dart';
import 'package:nhatlieu/cores/utils/colr_utils.dart';

class ThemeUtils {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(backgroundColor: ColrUtils.bgTop,
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: ColrUtils.primary,size:12),
      actionsIconTheme: IconThemeData(color: ColrUtils.primary,size: 12)));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: ColrUtils.bgTop,
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: ColrUtils.primary,size:12),
      actionsIconTheme: IconThemeData(color: ColrUtils.primary,size: 12)
      ));
}
