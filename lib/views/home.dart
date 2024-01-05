import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    SizedBox(width: 60.sp,),
                    SvgPicture.asset(
                      'assets/images/aten2.svg',
                      semanticsLabel: 'Attendity Logo',
                      height: 27,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.sp,),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 60.sp,
                      width: 60.sp,
                      child: CircleAvatar(
                        //radius: 40.sp,
                       child: SvgPicture.asset(
                         'assets/images/hIcon.svg',
                         semanticsLabel: 'Attendity Logo',
                       ),
                      ),
                    ),
                    SizedBox(width: 10.sp,),
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
              SizedBox(height: 60.sp,),
              Text("Hi, Adebayo",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 10.sp,),
              Text("Welcome to your class",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF97BCE8),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
