import 'package:attendity/controller/RegisterController/Reg_Lecturer.dart';
import 'package:attendity/controller/RegisterController/Register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterLecturer extends StatefulWidget {
  const RegisterLecturer({super.key});

  @override
  State<RegisterLecturer> createState() => _RegisterLecturerState();
}

class _RegisterLecturerState extends State<RegisterLecturer> {
  final _formKey = GlobalKey<FormState>();
  final RegLecturer _registerController = Get.put(RegLecturer());

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
                    'Register Lecturer',
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
                          controller: _registerController.emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Futa Email ID',
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
                          controller: _registerController.passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'password',
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
                          controller: _registerController.FullNamesController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Full name ',
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
                          controller: _registerController.CourseController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Course',
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
                  primary: Color(0xFF97BCE8),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //minimumSize: Size(343.sp, 50.sp),
                ),
                onPressed: () {
                  _registerController.Register();
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
