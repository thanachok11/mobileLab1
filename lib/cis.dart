import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const StudentListPage(),
    );
  }
}

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  final List<Student> students = const [
    Student(
        name: "Worachot Thonglert",
        id: "653450299-0",
        image: "../assets/images/male.png",
        gender: Gender.male),
    Student(
        name: "Ramin Kaiyabut",
        id: "653450297-4",
        image: "../assets/images/female.png",
        gender: Gender.female),
    Student(
        name: "Pathipat Mattra",
        id: "653450293-2",
        image: "../assets/images/male.png",
        gender: Gender.male),
    Student(
        name: "Worachit Thonglert",
        id: "653450298-2",
        image: "../assets/images/female.png",
        gender: Gender.female),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return StudentCard(student: student);
        },
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: student.gender == Gender.male
              ? [Colors.blue.shade400, Colors.blue.shade100]
              : [Colors.orange.shade400, Colors.orange.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // รูปภาพในรูปแบบวงกลม
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(student.image),
            ),
            const SizedBox(width: 16),
            // ข้อมูลนักศึกษา
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  student.id,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum Gender { male, female }

class Student {
  final String name;
  final String id;
  final String image;
  final Gender gender;

  const Student({
    required this.name,
    required this.id,
    required this.image,
    required this.gender,
  });
}
