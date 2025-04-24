import 'package:flutter/material.dart';

void main() {
  runApp(const MyCardApp());
}

class MyCardApp extends StatelessWidget {
  const MyCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danh Thiếp Kỹ Thuật Số',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyCard(),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 122, 176),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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',
              ), // Ảnh đại diện
            ),
            const Text(
              'Nguyễn Đình Quan', // Tên
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Kỹ Sư Phần Mềm', // Nghề nghiệp
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                title: const Text(
                  '+84 123 456 789',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 18,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                title: const Text(
                  'quandinh3011@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 18,
                    color: Color.fromARGB(255, 68, 138, 255),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
