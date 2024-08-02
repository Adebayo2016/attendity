import 'package:attendity/views/todayWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'historyWidget.dart';



class SingleStudentAttendanceHistory extends StatefulWidget {

  final String name;
  final String matricNumber;
  const SingleStudentAttendanceHistory({super.key, required this.name, required this.matricNumber});

  @override
  State<SingleStudentAttendanceHistory> createState() => _SingleStudentAttendanceHistoryState();
}

class _SingleStudentAttendanceHistoryState extends State<SingleStudentAttendanceHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.sp, vertical: 33.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/images/hIcon.svg',
                        semanticsLabel: 'Attendity Logo',
                        height: 27,
                      ),
                      SizedBox(
                        width: 60.sp,
                      ),
                      SvgPicture.asset(
                        'assets/images/aten2.svg',
                        semanticsLabel: 'Attendity Logo',
                        height: 27,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.sp,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          height: 60.sp,
                          width: 60.sp,
                          child: Initicon(
                            text: widget.name,
                            backgroundColor: Color(0xFF1A1A1A),
                            size: 60,
                          )),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          Text(
                            widget.matricNumber,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'current class: present',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.sp,
                ),
                Text(
                  "Attendance History",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                InkWell(
                    onTap: (){
                    },
                    child: historyWidget()
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
