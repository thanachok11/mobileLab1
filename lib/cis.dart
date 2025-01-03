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
        name: "Akkarawit Pobwongsa",
        id: "653450108-3",
        image: "assets/images/Ice.jpg",
        gender: Gender.male),
    Student(
        name: "Chadaporn Pinichsai",
        id: "653450281-9",
        image: "assets/images/Mind.jpg",
        gender: Gender.female),
    Student(
        name: "Pathipat Mattra",
        id: "653450293-2",
        image: "assets/images/Palm.jpg",
        gender: Gender.male),
    Student(
        name: "Natnicha Prompik",
        id: "653450284-3",
        image: "assets/images/Bam.jpg",
        gender: Gender.female),
    Student(
        name: "Worachit Thonglert",
        id: "653450298-2",
        image: "assets/images/Dunk.jpg",
        gender: Gender.male),
    Student(
        name: "Worachot Thonglert",
        id: "653450299-0",
        image: "assets/images/Dom.jpg",
        gender: Gender.male),
    Student(
        name: "Onpreeya Jantakote",
        id: "653450107-5",
        image: "assets/images/Mo.jpg",
        gender: Gender.female),
    Student(
        name: "Chawakorn Nueangpha",
        id: "653450087-5",
        image: "assets/images/P.jpg",
        gender: Gender.male),
    Student(
        name: "Junthima Promwang",
        id: "653450280-1",
        image: "assets/images/Piano.jpg",
        gender: Gender.female),
    Student(
        name: "Thanachok Suwan",
        id: "653450287-7",
        image: "assets/images/Boss.jpg",
        gender: Gender.male),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailPage(student: student),
          ),
        );
      },
      child: Container(
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
              Expanded(
                child: Column(
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
              ),
              // ลูกศรด้านขวา
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(student.image),
            ),
            const SizedBox(height: 16),
            Text(
              student.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "ID: ${student.id}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              "Gender: ${student.gender == Gender.male ? "Male" : "Female"}",
              style: const TextStyle(fontSize: 18),
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
