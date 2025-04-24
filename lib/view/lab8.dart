import 'package:flutter/material.dart';

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  String selectedGender = 'Male';
  double height = 180;
  int weight = 60;
  int age = 20;

  // Calculate BMI
  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  // Get BMI Category
  String getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi >= 18.5 && bmi < 25) return 'Normal';
    if (bmi >= 25 && bmi < 30) return 'Overweight';
    return 'Obese';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator'), centerTitle: true),
      body: Column(
        children: [
          // Gender Selection
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color:
                            selectedGender == 'Male'
                                ? Colors.blueAccent
                                : Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 70),
                          SizedBox(height: 10),
                          Text('MALE', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color:
                            selectedGender == 'Female'
                                ? Colors.pinkAccent
                                : Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 70),
                          SizedBox(height: 10),
                          Text('FEMALE', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Height Slider
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: TextStyle(fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(' cm'),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 120,
                    max: 220,
                    activeColor: Colors.redAccent,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Weight and Age
          Expanded(
            child: Row(
              children: [
                // Weight
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: TextStyle(fontSize: 18)),
                        Text(
                          '$weight',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle),
                              onPressed: () {
                                setState(() {
                                  if (weight < 150) weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Age
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: TextStyle(fontSize: 18)),
                        Text(
                          '$age',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () {
                                setState(() {
                                  if (age > 10) age--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle),
                              onPressed: () {
                                setState(() {
                                  if (age < 100) age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Calculate Button
          GestureDetector(
            onTap: () {
              double bmi = calculateBMI();
              String category = getBMICategory(bmi);
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Your BMI Result'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'BMI: ${bmi.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Category: $category',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
              );
            },
            child: Container(
              color: Colors.redAccent,
              height: 60,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
