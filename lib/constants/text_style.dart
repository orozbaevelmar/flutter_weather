import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MTextStyle {
  static TextStyle big(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 40,
        color: color,
      ),
    );
  }

  static TextStyle medium(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 28,
        color: color,
      ),
    );
  }

  static TextStyle small(Color color) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: color,
      ),
    );
  }
}
