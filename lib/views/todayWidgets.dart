import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class TodayWidget extends StatefulWidget {
  const TodayWidget({super.key});

  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF1A1A1A),
          width: 1,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              child: Initicon(
                text: 'CSC501',
                backgroundColor: Color(0xFF1A1A1A),
                size: 60,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CSC501',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('10:00 AM'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'you have been marked present',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ],
        )
      ),

    );
  }
}
