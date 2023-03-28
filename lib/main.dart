// Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// App
import 'src/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
