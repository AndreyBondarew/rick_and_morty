import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/theme/custom_colors.dart';
import 'package:rick_and_morty_test_restapi/app/view/theme/custom_text_style.dart';

class AppThemeDataBuilder {
  static ThemeData buildThemeDataLight() {
    return ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[CustomThemeColors.light, CustomThemeTextStyle.light]);
  }
}
