// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color background;
  late Color darkBackground;
  late Color textColor;
  late Color grayDark;
  late Color grayLight;
  late Color errorRed;
  late Color grayIcon;
  late Color gray200;
  late Color gray600;
  late Color black600;
  late Color tertiary400;
  late Color maximumBlueGreen;
  late Color plumpPurple;
  late Color platinum;
  late Color ashGray;
  late Color darkSeaGreen;
  late Color primaryBtnText;
  late Color lineColor;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF00968A);
  late Color secondaryColor = const Color(0xFFF2A384);
  late Color tertiaryColor = const Color(0xFF39D2C0);
  late Color alternate = const Color(0xFFDBE2E7);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF111417);
  late Color secondaryText = const Color(0xFF8B97A2);

  late Color background = Color(0xFF1A1F24);
  late Color darkBackground = Color(0xFF111417);
  late Color textColor = Color(0xFFFFFFFF);
  late Color grayDark = Color(0xFF57636C);
  late Color grayLight = Color(0xFF8B97A2);
  late Color errorRed = Color(0xFFF06A6A);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color gray200 = Color(0xFFDBE2E7);
  late Color gray600 = Color(0xFF262D34);
  late Color black600 = Color(0xFF090F13);
  late Color tertiary400 = Color(0xFF39D2C0);
  late Color maximumBlueGreen = Color(0xFF59C3C3);
  late Color plumpPurple = Color(0xFF52489C);
  late Color platinum = Color(0xFFEBEBEB);
  late Color ashGray = Color(0xFFCAD2C5);
  late Color darkSeaGreen = Color(0xFF84A98C);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lexend';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.w300,
        fontSize: 32.0,
      );
  String get title2Family => 'Lexend';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get title3Family => 'Lexend';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get subtitle1Family => 'Lexend';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get subtitle2Family => 'Lexend';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.textColor,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyText1Family => 'Lexend';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyText2Family => 'Lexend';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lexend';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.w300,
        fontSize: 32.0,
      );
  String get title2Family => 'Lexend';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get title3Family => 'Lexend';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get subtitle1Family => 'Lexend';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get subtitle2Family => 'Lexend';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.textColor,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyText1Family => 'Lexend';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyText2Family => 'Lexend';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Lexend';
  TextStyle get title1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.w300,
        fontSize: 32.0,
      );
  String get title2Family => 'Lexend';
  TextStyle get title2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get title3Family => 'Lexend';
  TextStyle get title3 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get subtitle1Family => 'Lexend';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get subtitle2Family => 'Lexend';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.textColor,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyText1Family => 'Lexend';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lexend',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodyText2Family => 'Lexend';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lexend',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF00968A);
  late Color secondaryColor = const Color(0xFFF2A384);
  late Color tertiaryColor = const Color(0xFF39D2C0);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF111417);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF8B97A2);

  late Color background = Color(0xFF1A1F24);
  late Color darkBackground = Color(0xFF111417);
  late Color textColor = Color(0xFFFFFFFF);
  late Color grayDark = Color(0xFF57636C);
  late Color grayLight = Color(0xFF8B97A2);
  late Color errorRed = Color(0xFFF06A6A);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color gray200 = Color(0xFFDBE2E7);
  late Color gray600 = Color(0xFF262D34);
  late Color black600 = Color(0xFF090F13);
  late Color tertiary400 = Color(0xFF39D2C0);
  late Color maximumBlueGreen = Color(0xFF59C3C3);
  late Color plumpPurple = Color(0xFF52489C);
  late Color platinum = Color(0xFFEBEBEB);
  late Color ashGray = Color(0xFFCAD2C5);
  late Color darkSeaGreen = Color(0xFF84A98C);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF22282F);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
