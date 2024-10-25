import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const greyColor = Color(0xFF868583);
  static const whiteColor = Color(0xFFFFFFFF);
  static const primaryColor = Color(0xFFFE5F5F);
  static const primaryColor2 = Color(0xFFFD8443);
  static const secondaryColor = Color(0xFFFFEBE8);
  static const yellow = Color(0xFFFFF84B);

  static ThemeData theme(BuildContext context) {
    return ThemeData(
      fontFamily: GoogleFonts.nunito().fontFamily,
    );
  }
}
