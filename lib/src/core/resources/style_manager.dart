import 'package:flutter/material.dart';
import 'font_manager.dart';

class FontStyleBuilder {
  final double _fontSize;
  final FontWeight _fontWeight;
  final Color _color;

  const FontStyleBuilder({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  })  : _fontSize = fontSize,
        _fontWeight = fontWeight,
        _color = color;

  TextStyle get spaceGrotesk => TextStyle(
        fontSize: _fontSize,
        fontFamily: FontConstants.spaceGrotesk,
        fontWeight: _fontWeight,
        color: _color,
      );

  TextStyle get inter => TextStyle(
        fontSize: _fontSize,
        fontFamily: FontConstants.inter,
        fontWeight: _fontWeight,
        color: _color,
      );
}

FontStyleBuilder getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return FontStyleBuilder(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

FontStyleBuilder getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return FontStyleBuilder(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

FontStyleBuilder getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return FontStyleBuilder(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}

FontStyleBuilder getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return FontStyleBuilder(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

FontStyleBuilder getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return FontStyleBuilder(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}
