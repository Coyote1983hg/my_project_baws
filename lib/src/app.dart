import 'package:flutter/material.dart';
import 'package:my_project_baws/src/data/auth_repository.dart';
import 'package:my_project_baws/src/features/authentification/presentation/welcome_screen.dart';
import 'package:my_project_baws/src/features/settings/theme_provider.dart';
import 'package:my_project_baws/src/features/shopping/presentation/start_screen.dart';
import 'package:my_project_baws/theme/theme.dart';
import 'package:provider/provider.dart';


class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    // List<QuizGame> allQuizGames = databaseRepository.getQuizgames();
    // QuizGame sampleQuizGame = allQuizGames[1];

    const loginKey = ValueKey('loginScreen');
    const overviewKey = ValueKey('overviewScreen');
    final isDarkMode = context.watch<ThemeProvider>().getThemeMode();
    return StreamBuilder(
        stream: context.read<AuthRepository>().authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            key: user == null ? loginKey : overviewKey,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode : isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: user == null ? const  WelcomeScreen(): const MyHomePage(),
            // OverviewScreen(databaseRepository: databaseRepository),
          );
        });
  }

/*
  @override
  Widget build(BuildContext context) {
    const signinKey = ValueKey('signinScreen');
    const welcomeKey = ValueKey('welcomeScreen');
    final authRepository = context.read<AuthRepository>();
    final userRepository = context.read<UserRepository>();
    final isDarkMode = context.watch<ThemeProvider>().getThemeMode();
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        StreamBuilder<User?>(
            stream: authRepository.authStateChanges(),
            builder: (context, snapshot) {
              final user = snapshot.data;

          return MaterialApp(
          debugShowCheckedModeBanner = false,
          titleLarge = 'My App',
          theme = lightMode,
          darkTheme = darkMode,
          themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home = 
              iuser != null ? {
                userRepository.getUserFromFirestore(user.uid);
                print("User null: ${user == null} ${user.email}");

                return const MyHomePage();
              } : {
                print("Snapshotdata: ${snapshot.data}"),
                return const WelcomeScreen()
              }
              
            },
          ),
        )
      },
    );
  }
  */
}
