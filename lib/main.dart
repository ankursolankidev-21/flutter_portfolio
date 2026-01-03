import 'package:flutter/material.dart';
import 'package:my_cv_web/resume_screen.dart';
import 'package:provider/provider.dart';

import 'theme/app_state.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AppState(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       colorScheme: .fromSeed(seedColor: Colors.deepPurple),
  //     ),
  //     home: ResumeScreen(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>(); // 👈 LISTEN TO STATE

    return MaterialApp(
      title: 'My CV',
      debugShowCheckedModeBanner: false,

      // Light theme
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // Dark theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),

      // 👇 THIS IS THE KEY LINE
      themeMode: appState.themeMode,

      home: const ResumeScreen(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Main.dart')
    );
  }
}
