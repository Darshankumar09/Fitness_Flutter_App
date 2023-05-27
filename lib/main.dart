import 'package:flutter/material.dart';
import 'package:practical_exam/views/screens/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
      },
    ),
  );
}