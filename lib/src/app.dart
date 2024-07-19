import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:my_project_baws/src/data/auth_repository.dart';
import 'package:my_project_baws/src/data/user_repository.dart';
import 'package:my_project_baws/src/features/authentification/presentation/welcome_screen.dart';
import 'package:my_project_baws/src/features/settings/theme_provider.dart';
import 'package:my_project_baws/src/features/shopping/presentation/start_screen.dart';
import 'package:my_project_baws/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const signinKey = ValueKey('signinScreen');
    const welcomeKey = ValueKey('welcomeScreen');
    final authRepository = context.read<AuthRepository>();
    final userRepository = context.read<UserRepository>();
    final isDarkMode = context.watch<ThemeProvider>().getThemeMode();
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
                theme: lightMode,
                darkTheme: darkMode,
                themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
                home: StreamBuilder<User?>(
                  stream: authRepository.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final user = snapshot.data;
                    // print("User null: ${user == null} ${user?.email}");

                    if (user != null) {
                      userRepository.getUserFromFirestore(user.uid);
                      return const MyHomePage();
                    } else {
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
