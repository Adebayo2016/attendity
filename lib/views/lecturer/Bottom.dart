import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomHome extends StatefulWidget {
  const BottomHome({super.key});

  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Row(
           children: [
             Container(
               color: Colors.red,
               height: 200,
             )

           ],

         )

       ],


    );
  }
}
