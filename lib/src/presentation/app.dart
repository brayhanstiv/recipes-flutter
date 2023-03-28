// Packages
import 'package:flutter/material.dart';

// Global
import 'package:recipes/src/presentation/global/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeLight,
      initialRoute: '/',
      routes: routes,
    );
  }
}
