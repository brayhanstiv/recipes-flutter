// Packages
import 'package:flutter/material.dart';
import 'package:recipes/src/presentation/views/index.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (context) => const OnBoardingPage(),
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/home': (context) => const HomePage(),
  '/detail': (context) => const DetailPage(),
  '/category': (context) => const CategoryPage(),
};
