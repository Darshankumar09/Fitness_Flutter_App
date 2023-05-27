import 'package:flutter/material.dart';
import 'package:practical_exam/controller/providers/fitness_provider.dart';
import 'package:practical_exam/views/screens/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FitnessProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    ),
  );
}
