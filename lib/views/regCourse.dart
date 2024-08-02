import 'package:attendity/controller/RegisterController/Reg_Lecturer.dart';
import 'package:attendity/controller/RegisterController/Register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/RegisterController/regCourseController.dart';

class RegisterCourse extends StatefulWidget {
  const RegisterCourse({super.key});

  @override
  State<RegisterCourse> createState() => _RegisterCourseState();
}

class _RegisterCourseState extends State<RegisterCourse> {
  final _formKey = GlobalKey<FormState>();
  final RegCourseController _registerController = Get.put(RegCourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(height: 20,),
              Container(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/aten2.svg',
                    semanticsLabel: 'Attendity Logo',
                    height: 36.sp,
                  ),
                ),
              ),
              SizedBox(height: 39.sp,),

              Container(
                child: Center(
                  child:SvgPicture.asset(
                    'assets/images/loginImage.svg',
                    semanticsLabel: 'Attendity Logo',
                    height: 200.sp,
                  ),
                ),
              ),
              SizedBox(height: 27.sp,),

              Container(
                child: Center(
                  child: Text(
                    'Register New Course ',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12.sp,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: TextField(
                          controller: _registerController.courseNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Course Name',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 12.sp,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: TextField(
                          controller: _registerController.dayController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'day of the week',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.sp,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: TextField(
                          controller: _registerController.lecturerNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Lecturer Name',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.sp,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: TextField(
                          controller: _registerController.timeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Time of the day',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.sp,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: TextField(
                          controller: _registerController.DepartmentController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Department',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.sp,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF97BCE8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //minimumSize: Size(343.sp, 50.sp),
                ),
                onPressed: () {
                  _registerController.saveUserDetails();
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
