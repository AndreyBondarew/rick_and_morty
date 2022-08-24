import 'package:flutter/material.dart';

@immutable
class CustomThemeTextStyle extends ThemeExtension<CustomThemeTextStyle> {
  final TextStyle? primaryName;
  final TextStyle? fieldName;
  final TextStyle? fieldData;
  final TextStyle? secondaryFieldName;
  final TextStyle? secondaryFieldData;

  final TextStyle? footerPrimaryText;
  final TextStyle? footerSecondaryText;

  const CustomThemeTextStyle({
    required this.primaryName,
    required this.fieldName,
    required this.fieldData,
    required this.secondaryFieldName,
    required this.secondaryFieldData,
    required this.footerPrimaryText,
    required this.footerSecondaryText,
  });

  @override
  ThemeExtension<CustomThemeTextStyle> copyWith({
    TextStyle? primaryName,
    TextStyle? fieldName,
    TextStyle? fieldData,
    TextStyle? secondaryFieldName,
    TextStyle? secondaryFieldData,
    TextStyle? footerPrimaryText,
    TextStyle? footerSecondaryText,
  }) {
    return CustomThemeTextStyle(
      primaryName: primaryName ?? this.primaryName,
      fieldName: fieldName ?? this.fieldName,
      fieldData: fieldData ?? this.fieldData,
      secondaryFieldName: secondaryFieldName ?? this.secondaryFieldName,
      secondaryFieldData: secondaryFieldData ?? this.secondaryFieldData,
      footerPrimaryText: footerPrimaryText ?? this.footerPrimaryText,
      footerSecondaryText: footerSecondaryText ?? this.footerSecondaryText,
    );
  }

  @override
  ThemeExtension<CustomThemeTextStyle> lerp(ThemeExtension<CustomThemeTextStyle>? other, double t) {
    if (other is! CustomThemeTextStyle) {
      return this;
    }
    return CustomThemeTextStyle(
      primaryName: TextStyle.lerp(primaryName, other.primaryName, t),
      fieldName: TextStyle.lerp(fieldName, other.fieldName, t),
      fieldData: TextStyle.lerp(fieldData, other.fieldData, t),
      secondaryFieldName: TextStyle.lerp(secondaryFieldName, other.secondaryFieldName, t),
      secondaryFieldData: TextStyle.lerp(secondaryFieldData, other.secondaryFieldData, t),
      footerPrimaryText: TextStyle.lerp(footerPrimaryText, other.footerPrimaryText, t),
      footerSecondaryText: TextStyle.lerp(footerSecondaryText, other.footerSecondaryText, t),
    );
  }

  static const light = CustomThemeTextStyle(
    primaryName: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 22,
    ),
    fieldName: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
    fieldData: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 16,
    ),
    secondaryFieldName: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    ),
    secondaryFieldData: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    footerPrimaryText: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    footerSecondaryText: TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
  );

  static const dark = CustomThemeTextStyle(
    primaryName: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w800,
      fontSize: 22,
    ),
    fieldName: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
    fieldData: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w800,
      fontSize: 16,
    ),
    secondaryFieldName: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    ),
    secondaryFieldData: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    footerPrimaryText: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    footerSecondaryText: TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
  );
}
