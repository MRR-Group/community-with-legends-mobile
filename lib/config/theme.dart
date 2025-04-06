import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    margin: const EdgeInsets.all(0),
    color: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    insetPadding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    elevation: 0,

  ),

);
