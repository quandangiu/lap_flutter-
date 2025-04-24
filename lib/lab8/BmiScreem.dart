import 'package:flutter/material.dart';
import 'package:lab_flutter/lab8/BMIResult.dart';

void main() {
  runApp(const BMICalculatorApp());
}

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
      home: const BMICalculatorHome(),
    );
  }
}

class BMICalculatorHome extends StatefulWidget {
  const BMICalculatorHome({super.key});

  @override
  _BMICalculatorHomeState createState() => _BMICalculatorHomeState();
}

class _BMICalculatorHomeState extends State<BMICalculatorHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Máy Tính Chỉ Số BMI'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [Tab(text: 'Tính BMI'), Tab(text: 'Lịch Sử')],
          ),
        ),
        body: const TabBarView(
          children: [BMICalculatorScreen(), BMIHistoryScreen()],
        ),
      ),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  String selectedGender = 'Nam';
  double height = 180;
  int weight = 60;
  int age = 20;
  bool isAthlete = false;
  String athleteType = 'general'; // Thêm biến để lưu loại vận động viên

  // Danh sách lưu lịch sử
  static List<BMIResult> history = [];

  // Tính BMI
  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Chọn giới tính
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Nam';
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors:
                            selectedGender == 'Nam'
                                ? [Colors.blueAccent, Colors.blue]
                                : [Colors.grey.shade800, Colors.grey.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male, size: 70, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          'NAM',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Nữ';
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors:
                            selectedGender == 'Nữ'
                                ? [Colors.pinkAccent, Colors.pink]
                                : [Colors.grey.shade800, Colors.grey.shade700],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female, size: 70, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          'NỮ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Chiều cao
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.grey, Colors.grey],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CHIỀU CAO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
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
                        color: Colors.white,
                      ),
                    ),
                    const Text(' cm', style: TextStyle(color: Colors.white70)),
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
        // Cân nặng, tuổi
        Expanded(
          child: Row(
            children: [
              // Cân nặng
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.grey, Colors.grey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'CÂN NẶNG',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        '$weight',
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                if (weight > 20) weight--;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.greenAccent,
                            ),
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
              // Tuổi
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.grey, Colors.grey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'TUỔI',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        '$age',
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                if (age > 1) age--;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.greenAccent,
                            ),
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
        // Checkbox vận động viên
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Checkbox(
                value: isAthlete,
                onChanged: (value) {
                  setState(() {
                    isAthlete = value ?? false;
                  });
                },
                activeColor: Colors.redAccent,
              ),
              const Text(
                'Bạn là vận động viên?',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
        // Dropdown loại vận động viên
        Visibility(
          visible: isAthlete,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButton<String>(
              value: athleteType,
              dropdownColor: Colors.grey.shade800,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              items: const [
                DropdownMenuItem(
                  value: 'general',
                  child: Text('Vận động viên chung'),
                ),
                DropdownMenuItem(
                  value: 'endurance',
                  child: Text('Vận động viên sức bền'),
                ),
                DropdownMenuItem(
                  value: 'strength',
                  child: Text('Vận động viên sức mạnh'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  athleteType = value ?? 'general';
                });
              },
            ),
          ),
        ),
        // Nút tính toán
        GestureDetector(
          onTap: () {
            double bmi = calculateBMI();
            var result = BMIResult.getBMICategory(
              bmi,
              age,
              isAthlete,
              athleteType,
            );
            String category = result['category'];
            Color categoryColor = result['color'];
            String risk = result['risk'];
            String advice = result['advice'];
            double idealWeight = BMIResult.calculateIdealBMI(height);

            // Lưu vào lịch sử
            setState(() {
              history.add(
                BMIResult(
                  gender: selectedGender,
                  height: height,
                  weight: weight,
                  age: age,
                  bmi: bmi,
                  category: category,
                  timestamp: DateTime.now(),
                  categoryColor: categoryColor,
                  risk: risk,
                  advice: advice,
                  isAthlete: isAthlete,
                  athleteType: athleteType, // Truyền athleteType
                ),
              );
            });

            // Hiển thị thông báo
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đã lưu kết quả vào lịch sử!'),
                duration: Duration(seconds: 2),
              ),
            );

            // Hiển thị kết quả
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Text('Kết Quả BMI Của Bạn'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chỉ số BMI: ${bmi.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Phân loại: $category',
                            style: TextStyle(
                              fontSize: 20,
                              color: categoryColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Cân nặng lý tưởng: ${idealWeight.toStringAsFixed(1)} kg',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Nguy cơ sức khỏe: $risk',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Lời khuyên: $advice',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Đóng'),
                      ),
                    ],
                  ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(15),
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.redAccent, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'TÍNH TOÁN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BMIHistoryScreen extends StatelessWidget {
  const BMIHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _BMICalculatorScreenState.history.isEmpty
        ? const Center(child: Text('Chưa có lịch sử tính toán.'))
        : ListView.builder(
          itemCount: _BMICalculatorScreenState.history.length,
          itemBuilder: (context, index) {
            final result = _BMICalculatorScreenState.history[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: ListTile(
                title: Text(
                  'BMI: ${result.bmi.toStringAsFixed(2)} - ${result.category}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: result.categoryColor,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Giới tính: ${result.gender}'),
                    Text('Chiều cao: ${result.height.toStringAsFixed(0)} cm'),
                    Text('Cân nặng: ${result.weight} kg'),
                    Text('Tuổi: ${result.age}'),
                    Text('Vận động viên: ${result.isAthlete ? "Có" : "Không"}'),
                    if (result.isAthlete)
                      Text('Loại vận động viên: ${result.athleteType}'),
                    Text('Thời gian: ${result.timestamp.toString()}'),
                  ],
                ),
              ),
            );
          },
        );
  }
}
