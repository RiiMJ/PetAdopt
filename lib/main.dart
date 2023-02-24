import 'package:flutter/material.dart';
import 'screens/root_app.dart';
//import 'color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PET ADOPT',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: const RootApp(),
    );
  }
}
