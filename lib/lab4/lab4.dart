import 'dart:math';
import 'package:flutter/material.dart';

class Magic8BallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Magic8BallScreen(),
    );
  }
}

class Magic8BallScreen extends StatefulWidget {
  @override
  _Magic8BallScreenState createState() => _Magic8BallScreenState();
}

class _Magic8BallScreenState extends State<Magic8BallScreen> {
  final List<String> ballImages = [
    'images/ball1.png',
    'images/ball2.png',
    'images/ball3.png',
    'images/ball4.png',
    'images/ball5.png',
  ];

  int currentImageIndex = 0;

  void changeImage() {
    setState(() {
      currentImageIndex = Random().nextInt(ballImages.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Magic 8 Ball")),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ballImages[currentImageIndex]),
            SizedBox(height: 20),
            ElevatedButton(onPressed: changeImage, child: Text("Hỏi tôi đi!")),
          ],
        ),
      ),
    );
  }
}
