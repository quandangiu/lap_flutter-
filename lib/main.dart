import 'package:flutter/material.dart';
import 'package:lab_flutter/lab3/lab3.dart';
import 'package:lab_flutter/lab4/lab4.dart';
import 'package:lab_flutter/lab5/lab5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DiceApp(),
    );
    // lab 9 mới cài cái này
    //    return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData.dark(),
    //     home: const LoadingScreen(),
    //   );
    // }
  }
}
