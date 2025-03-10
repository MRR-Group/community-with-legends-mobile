import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  fontFamily: GoogleFonts.getFont('Jaro').fontFamily,
  scaffoldBackgroundColor: backgroundColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColor),
    bodyMedium: TextStyle(color: textColor),
    bodySmall: TextStyle(color: textColor),
    displayLarge: TextStyle(color: textColor),
    displayMedium: TextStyle(color: textColor),
    displaySmall: TextStyle(color: textColor),
    titleLarge: TextStyle(color: textColor),
    titleMedium: TextStyle(color: textColor),
    titleSmall: TextStyle(color: textColor),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return textDisabledColor;
        } else if (states.contains(WidgetState.pressed)) {
          return textHoverColor;
        }
        return textColor;
      }),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return textDisabledColor;
        } else if (states.contains(WidgetState.pressed)) {
          return textHoverColor;
        }
        return textColor;
      }),
    ),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
  ),
  cardTheme: CardTheme(
    color: backgroundColor,
    margin: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: secondaryColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),

);
