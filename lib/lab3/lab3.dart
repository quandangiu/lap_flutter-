import 'dart:math';
import 'package:flutter/material.dart';

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final List<String> diceImages = [
    'https://cdn.pixabay.com/photo/2014/04/03/10/24/one-310338_1280.png',
    'https://cdn.pixabay.com/photo/2014/04/03/10/24/two-310337_1280.png',
    'https://cdn.pixabay.com/photo/2014/04/03/10/24/three-310336_1280.png',
    'https://cdn.pixabay.com/photo/2014/04/03/10/24/four-310335_1280.png',
    'https://cdn.pixabay.com/photo/2014/04/03/10/24/five-310334_1280.png',
    'https://cdn.pixabay.com/photo/2014/04/03/10/24/six-310333_1280.png',
  ];

  int leftDice = 0;
  int rightDice = 0;
  int totalScore = 0;

  void rollDice() {
    setState(() {
      leftDice = Random().nextInt(6);
      rightDice = Random().nextInt(6);
      totalScore = (leftDice + 1) + (rightDice + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice Roller'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(diceImages[leftDice], width: 100),
                const SizedBox(width: 20),
                Image.network(diceImages[rightDice], width: 100),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Total Score: $totalScore',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: rollDice, child: const Text('Roll Dice')),
          ],
        ),
      ),
    );
  }
}
