import 'package:attendity/views/students/classInfoTop.dart';
import 'package:flutter/material.dart';

class JoinClassInfo extends StatefulWidget {
  const JoinClassInfo({super.key});

  @override
  State<JoinClassInfo> createState() => _JoinClassInfoState();
}

class _JoinClassInfoState extends State<JoinClassInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         ClassInfo(),

        ],
      ),
    );
  }
}
