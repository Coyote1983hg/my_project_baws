import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  shadow: Color(0xFF000000),
  outlineVariant: Color.fromRGBO(194, 200, 188, 1),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF416FDF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF6EAEE7),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

ThemeData lightMode = FlexThemeData.light(
                  // Theme config for FlexColorScheme version 7.3.x. Make sure you use
                  // same or higher package version, but still same major version. If you
                  // use a lower package version, some properties may not be supported.
                  // In that case remove them after copying this theme to your app.

                  scheme: FlexScheme.aquaBlue,
                  usedColors: 7,
                  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                  blendLevel: 17,
                  bottomAppBarElevation: 5.5,
                  subThemesData: const FlexSubThemesData(
                    blendOnLevel: 10,
                    blendOnColors: false,
                    blendTextTheme: true,
                    useTextTheme: true,
                    useM2StyleDividerInM3: true,
                    thickBorderWidth: 2.0,
                    textButtonRadius: 9.0,
                    textButtonSchemeColor: SchemeColor.tertiaryContainer,
                    filledButtonRadius: 10.0,
                    filledButtonSchemeColor: SchemeColor.tertiary,
                    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
                    elevatedButtonSecondarySchemeColor:
                        SchemeColor.primaryContainer,
                    outlinedButtonRadius: 10.0,
                    segmentedButtonUnselectedSchemeColor:
                        SchemeColor.tertiaryContainer,
                    inputDecoratorSchemeColor: SchemeColor.primary,
                    inputDecoratorBackgroundAlpha: 26,
                    inputDecoratorRadius: 8.0,
                    inputDecoratorUnfocusedHasBorder: false,
                    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
                    alignedDropdown: true,
                    useInputDecoratorThemeInDialogs: true,
                    appBarBackgroundSchemeColor: SchemeColor.tertiary,
                    appBarScrolledUnderElevation: 8.0,
                    drawerElevation: 1.0,
                    drawerWidth: 270.0,
                    bottomNavigationBarSelectedLabelSchemeColor:
                        SchemeColor.secondary,
                    bottomNavigationBarMutedUnselectedLabel: false,
                    bottomNavigationBarSelectedIconSchemeColor:
                        SchemeColor.secondary,
                    bottomNavigationBarMutedUnselectedIcon: false,
                    menuBarBackgroundSchemeColor:
                        SchemeColor.secondaryContainer,
                    navigationBarSelectedLabelSchemeColor:
                        SchemeColor.onSecondaryContainer,
                    navigationBarSelectedIconSchemeColor: SchemeColor.tertiary,
                    navigationBarIndicatorSchemeColor:
                        SchemeColor.secondaryContainer,
                    navigationBarIndicatorOpacity: 1.00,
                    navigationBarIndicatorRadius: 16.0,
                    navigationBarOpacity: 0.64,
                    navigationBarElevation: 1.0,
                    navigationBarHeight: 72.0,
                    navigationRailSelectedLabelSchemeColor:
                        SchemeColor.onSecondaryContainer,
                    navigationRailSelectedIconSchemeColor:
                        SchemeColor.onSecondaryContainer,
                    navigationRailIndicatorSchemeColor:
                        SchemeColor.secondaryContainer,
                    navigationRailIndicatorOpacity: 1.00,
                  ),
                  useMaterial3ErrorColors: true,
                  visualDensity: FlexColorScheme.comfortablePlatformDensity,
                  useMaterial3: true,
                  // To use the Playground font, add GoogleFonts package and uncomment
                  // fontFamily: GoogleFonts.notoSans().fontFamily,
                );

ThemeData darkMode = FlexThemeData.dark(
  colors: FlexColor.schemes[FlexScheme.aquaBlue]!.light.defaultError
      .toDark(40, false),
  usedColors: 7,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 10,
  appBarStyle: FlexAppBarStyle.background,
  bottomAppBarElevation: 2.0,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendTextTheme: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    thickBorderWidth: 2.0,
    textButtonRadius: 9.0,
    textButtonSchemeColor: SchemeColor.tertiaryContainer,
    filledButtonRadius: 10.0,
    filledButtonSchemeColor: SchemeColor.tertiary,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    outlinedButtonRadius: 10.0,
    segmentedButtonUnselectedSchemeColor: SchemeColor.tertiaryContainer,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 48,
    inputDecoratorRadius: 8.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    drawerElevation: 1.0,
    drawerWidth: 290.0,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
    navigationBarSelectedIconSchemeColor: SchemeColor.tertiary,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarIndicatorRadius: 16.0,
    navigationBarOpacity: 0.64,
    navigationBarElevation: 1.0,
    navigationBarHeight: 72.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSecondaryContainer,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
