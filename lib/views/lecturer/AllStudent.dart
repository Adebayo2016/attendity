// lib/views/StudentListPage.dart
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'AttendanceHistory.dart';


class Student {
  final String name;
  final String level;

  Student({required this.name, required this.level});
}

class StudentListPage extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'Adebayo Adewale', level: 'IFT/17/2489'),
    Student(name: 'Dada Musa ', level: 'IFT/17/2381'),
    Student(name: 'Adesanloye Isijola', level: 'IFT/17/2369'),
    Student(name: 'Samuel David ', level: 'IFT/17/2385'),
    Student(name: 'Charlie Davis', level: 'IFT/17/2356'),
    Student(name: 'Diana Evans', level: 'IFT/17/2989'),
    Student(name: 'Ethan Foster', level: 'IFT/17/2879'),
    Student(name: 'Fiona Green', level: 'IFT/17/2309'),
    Student(name: 'George Harris', level: 'IFT/17/2189'),
    Student(name: 'Hannah White', level: 'IFT/17/2489'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleStudentAttendanceHistory(
                    name: student.name,
                    matricNumber: student.level,
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Initicon(
                      text: student.name,
                      backgroundColor: Color(0xFF1A1A1A),
                      size: 60,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          student.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        Text(
                          student.level,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}