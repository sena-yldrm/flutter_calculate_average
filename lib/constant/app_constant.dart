import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  //nesne üretmeden direkt çağırabilmen için
  static const MaterialColor primaryColorr = Colors.indigo;
  static const String titleText = "Calculate Average";
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: primaryColorr);
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle lessonNumberStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: primaryColorr);
  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 35, fontWeight: FontWeight.w800, color: primaryColorr);
  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final horizontalPadding = EdgeInsets.symmetric(horizontal: 8);
}
