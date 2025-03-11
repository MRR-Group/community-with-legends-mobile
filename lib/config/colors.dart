import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFF181719);
const Color backgroundLightColor = Color(0xFF212023);
const Color textColor = Color(0xFFFDFEFE);
const Color textHoverColor = Color(0xFFFFFFFF);
const Color textDisabledColor = Color(0xFFB9B9BA);
const Color primaryColor = Color(0xFF8E2CFE);
const Color primaryHoverColor = Color(0xFF5300B0);
const Color secondaryColor = Color(0xFF1E9AC8);
const Color secondaryDarkColor = Color(0xFF9C9C9C);
const Gradient primaryGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: [0.0, 0.5, 1.0],
  colors: [Color(0xFF9C44FF), Color(0xFF8418FF), Color(0xFF8E2CFE)],
);
const Gradient secondaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0, 1.0],
  colors: [secondaryColor, primaryColor],
);
