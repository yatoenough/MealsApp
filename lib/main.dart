import 'package:flutter/material.dart';
import 'package:meals/themes/main_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: mainTheme,
      home: const Scaffold(),
    );
  }
}
