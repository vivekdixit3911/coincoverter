// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'design.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("COIN EX-CHANGE"),
        ),
        body: design(),
      ),
    );
  }
}
