// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

class ColrUtils {

/// primary color 
  static Color primary = fromHexString('#EFEFEF');
  static int primaryint= ColorToIn('#EFEFEF');

//backgroud color
  static Color bgprimary = fromHexString('#981B1F');
  static int bgprimaryint= ColorToIn('#981B1F');

//top background
  static Color bgTop = fromHexString('#AE2E26');
  static int bgTopint= ColorToIn('#AE2E26');

//textfield color
  static Color textFill = fromHexString('#F6F6F6');
  static Color textborder= fromHexString('#D6D6D6');
  static Color textprimary = fromHexString('#313450');

  static Color fromHexString(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static int ColorToIn(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return int.parse(buffer.toString(),radix: 16);
  }
}
