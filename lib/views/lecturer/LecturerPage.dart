import 'package:attendity/controller/HomeController/Lecturer/LecturerHomeController.dart';
import 'package:attendity/views/lecturer/Bottom.dart';
import 'package:attendity/views/lecturer/TOPcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LecturerPage extends StatefulWidget {
  const LecturerPage({super.key});

  @override
  State<LecturerPage> createState() => _LecturerPageState();
}

class _LecturerPageState extends State<LecturerPage> {
  final LecturerHomeController _lecturerHomeController =Get.put(LecturerHomeController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(

        children: [
          TopContainer(),
          SizedBox(height: 20,),
          Text(_lecturerHomeController.allLecturerCourses.length.toString()),
        ],
      ),

    );
  }
}
