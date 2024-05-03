import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';


// die Wurzel unseres Widgets-Tree
// (besteht aus nur einem MaterialApp-Widget)
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MaterialApp(),
      theme: FlexThemeData.light(scheme: FlexScheme.greyLaw),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.greyLaw),
      themeMode: ThemeMode.light,
    );
  }
}