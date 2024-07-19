import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:my_project_baws/src/data/auth_repository.dart';
import 'package:my_project_baws/src/data/user_repository.dart';
import 'package:my_project_baws/src/features/authentification/presentation/welcome_screen.dart';
import 'package:my_project_baws/src/features/settings/theme_provider.dart';
import 'package:my_project_baws/src/features/shopping/presentation/start_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_project_baws/theme/theme.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const signinKey = ValueKey('signinScreen');
    const welcomeKey = ValueKey('welcomeScreen');
    final authRepository = context.read<AuthRepository>();
    final userRepository = context.read<UserRepository>();
    return StreamBuilder<User?>(
        stream: authRepository.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
         // print("User null: ${user == null} ${user?.email}");
          if (user != null) {
            userRepository.getUserFromFirestore(user.uid);
          }
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'My App',
                theme: FlexThemeData.light(
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
                  menuBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
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
              ),
              darkTheme: FlexThemeData.dark(
                colors: FlexColor
                    .schemes[FlexScheme.aquaBlue]!.light.defaultError
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
                  elevatedButtonSecondarySchemeColor:
                      SchemeColor.primaryContainer,
                  outlinedButtonRadius: 10.0,
                  segmentedButtonUnselectedSchemeColor:
                      SchemeColor.tertiaryContainer,
                  inputDecoratorSchemeColor: SchemeColor.primary,
                  inputDecoratorBackgroundAlpha: 48,
                  inputDecoratorRadius: 8.0,
                  inputDecoratorUnfocusedHasBorder: false,
                  inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
                  alignedDropdown: true,
                  useInputDecoratorThemeInDialogs: true,
                  drawerElevation: 1.0,
                  drawerWidth: 290.0,
                  bottomNavigationBarSelectedLabelSchemeColor:
                      SchemeColor.secondary,
                  bottomNavigationBarMutedUnselectedLabel: false,
                  bottomNavigationBarSelectedIconSchemeColor:
                      SchemeColor.secondary,
                  bottomNavigationBarMutedUnselectedIcon: false,
                  menuBarBackgroundSchemeColor: SchemeColor.secondaryContainer,
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
              ),
              themeMode: ThemeMode.light,
    
                home: StreamBuilder<User?>(
                  stream: authRepository.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Afișează un ecran de încărcare în timp ce se verifică starea de autentificare
                      return const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final user = snapshot.data;
                   // print("User null: ${user == null} ${user?.email}");

                    if (user != null) {
                      // Utilizator autentificat
                      userRepository.getUserFromFirestore(user.uid);
                      return const MyHomePage();
                    } else {
                      // Utilizator neautentificat
                      return const WelcomeScreen();
                    }
                  },
                ),
              );
            },
          );
        });
  }
}
