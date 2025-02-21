import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon_design/moon_design.dart';
import 'package:proj_app/features/theme/domain/theme_model.dart';

class FlexThemeProvider extends Notifier<ThemeModel> {
  ThemeMode currMode = ThemeMode.system;

  @override
  ThemeModel build() {
    return ThemeModel(
        lightTheme: lightTheme, darkTheme: darkTheme, currTheme: currMode);
  }

  void switchMode(ThemeMode newMode) {
    state = state.copyWith(mode: newMode);
    currMode = newMode;
  }

  ThemeData lightTheme = FlexThemeData.light(
    scheme: FlexScheme.aquaBlue,
    extensions: <ThemeExtension<dynamic>>[
      MoonTheme(tokens: MoonTokens.light),
    ],
    surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 1,
    appBarElevation: 2,
    useMaterial3: true,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    tooltipsMatchBackground: true,
    swapColors: false,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.outfit().fontFamily,
    subThemesData: const FlexSubThemesData(
      useMaterial3Typography: true,
      fabUseShape: true,
      interactionEffects: true,
      navigationBarMutedUnselectedIcon: true,
      bottomNavigationBarOpacity: 1,
      bottomNavigationBarElevation: 0,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      popupMenuOpacity: 0.95,
    ),
  );

  ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.aquaBlue,
    extensions: <ThemeExtension<dynamic>>[
      MoonTheme(tokens: MoonTokens.dark),
    ],
    useMaterial3: true,
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    blendLevel: 26, //settings.darkBlendLevel(),
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 1,
    appBarElevation: 2,
    transparentStatusBar: true, //settings.usingtransparentStatusBar(),
    tabBarStyle: FlexTabBarStyle.forAppBar,
    tooltipsMatchBackground: true,
    swapColors: false,
    // darkIsTrueBlack: settings.darkIsTrueBlack(),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use playground font, add GoogleFonts package and uncomment:
    fontFamily: GoogleFonts.outfit().fontFamily,
    subThemesData: const FlexSubThemesData(
      useMaterial3Typography: true,
      fabUseShape: true,
      interactionEffects: true,
      bottomNavigationBarOpacity: 1,
      bottomNavigationBarElevation: 0,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorUnfocusedHasBorder: true,
      blendOnColors: true,
      navigationBarMutedUnselectedIcon: true,
      popupMenuOpacity: 0.95,
    ),
  );
}

final themeProvider =
    NotifierProvider<FlexThemeProvider, ThemeModel>(FlexThemeProvider.new);
