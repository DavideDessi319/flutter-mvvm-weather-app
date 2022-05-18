import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.copyWith(
                headline1: const TextStyle(
                  fontSize: 110,
                  color: Colors.white,
                  letterSpacing: -2,
                  fontWeight: FontWeight.w400,
                ),
                headline4: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w500,
                ),
                headline5: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.80),
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w500,
                ),
                headline6: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w500,
                ),
                bodyText1: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
                bodyText2: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300,
                ),
                subtitle1: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
                subtitle2: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
                caption: const TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
              ),
        ),
      );
}
