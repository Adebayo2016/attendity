import 'package:attendity/controller/LoginController/login_Controller.dart';
import 'package:attendity/views/students/JoinClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 8),
      child: Scaffold(
        floatingActionButton:  FloatingActionButton(
          onPressed: () {
            Get.to(() => JoinQRCodeScannerPage());
          },
          child:Text('Join Class'),
        ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                'Login to your Account ',
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
                      controller: _loginController.emailController,
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
                      controller: _loginController.passwordController,
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
              _loginController.Login(context);
            },
            child: const Text('Log in'),
          ),
        ],
        ),
      ),
    ),
    );
  }
}
