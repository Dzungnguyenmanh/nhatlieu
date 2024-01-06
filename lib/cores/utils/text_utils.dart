import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nhatlieu/cores/utils/colr_utils.dart';

class TextUtils {
  static final TextStyle cardTitle = TextStyle(
      color: ColrUtils.textprimary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.lato().fontFamily);

  static final TextStyle cardSubTitle =
      GoogleFonts.lato(fontSize: 12, color: Colors.grey[600]);
}
