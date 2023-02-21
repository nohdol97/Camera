import 'package:flutter/material.dart';
import 'tournamant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Tournament(title: "Flutter Demo Home Page"),
    );
  }
}

// run as
// flutter run -d chrome --web-renderer html