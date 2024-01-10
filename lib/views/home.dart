import 'package:attendity/views/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/HomeController/home_Controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },

      ),
      body: SafeArea(
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
                        //radius: 40.sp,
                        text: 'Adebayo Adewale',

                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adebayo Adewale',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        Text(
                          'IFT/17/2389',
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
                "Hi, Adebayo",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                "Welcome to your class",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF97BCE8),
                ),
              ),
              SizedBox(
                height: 50.sp,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => Today());
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today's Classes",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          )
                      ),
                      SvgPicture.asset('assets/images/Polygon.svg')
                    ],

                  ),
                ),
              ),
              SizedBox(height:24.sp),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF2F2F2),
                  border: Border.all(
                    color: Color(0xFF97BCE8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.sp,),
                    Row(
                      children: [
                        Initicon(text: 'IFT'),

                        SizedBox(width: 20.sp,),
                        Text("IFT 508",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),
                        Text("8:00am - 10:00am",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),

                      ],

                    ),
                    SizedBox(height: 5.sp,),
                    Row(
                      children: [
                        Initicon(
                          text: 'IFT',
                        ),
                        SizedBox(width: 20.sp,),
                        Text("IFT 506",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),
                        Text("10:00am - 12:00PM",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),

                      ],

                    ),
                    SizedBox(height: 5.sp,),
                    Row(
                      children: [
                        CircleAvatar(
                          //radius: 40.sp,
                            child: Text(
                                'A'
                            )
                        ),
                        SizedBox(width: 20.sp,),
                        Text("CSC 508",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),
                        Text("12:00pm -2:00pm",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),

                      ],

                    ),
                    SizedBox(height: 5.sp,),
                    Row(
                      children: [
                        CircleAvatar(
                          //radius: 40.sp,
                            child: Text(
                                'A'
                            )
                        ),
                        SizedBox(width: 20.sp,),
                        Text("IFT 502",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),
                        Text("8:00am - 10:00am",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A),
                            )
                        ),
                        SizedBox(width: 20.sp,),

                      ],

                    )

                  ],
                ),
              ),
              SizedBox(height: 24.sp,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Attendance History",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        )
                    ),
                    SvgPicture.asset('assets/images/Polygon.svg')
                  ],

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
