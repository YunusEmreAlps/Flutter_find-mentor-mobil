// Flutter imports:
import 'package:flutter/material.dart';

// Gradients
class AppGradients {
  static final Shader primaryTextGradientColor = LinearGradient(
    colors: <Color>[Color(0xFF216383), Color(0xFF71BFBC)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static final primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF216383), Color(0xFF71BFBC)],
  );
}
