import 'package:attendity/controller/HomeController/Students/studentController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Attendancefailed.dart';
import 'classSuccessful.dart';

class ClassInfo extends StatelessWidget {
  const ClassInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final studentController _studentController = Get.put(studentController());
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/mas.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            border: Border.all(),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Class Info',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                                fontFamily: GoogleFonts.openSans().fontFamily,
                              ),

                            ),
                            SvgPicture.asset('asset/images/prof.svg'),
                          ],
                        ),
                        SizedBox(height: 32,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFF2F2F2),
                            border: Border.all(
                              color: Color(0xFF97BCE8),
                            ),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Course Code",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1A1A1A),
                                      fontFamily: GoogleFonts.openSans().fontFamily,
                                    )
                                ),

                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Text("IFT502",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF1A1A1A),
                                          fontFamily: GoogleFonts.openSans().fontFamily,
                                        )),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  )
              ),
              SizedBox(height: 32,),

            ],
          ),
        ),
        SizedBox(height: 32,),

        Text('Enter your Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
        ),

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
                    controller: _studentController.nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Full name',
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
        SizedBox(height: 20,),
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
                    controller: _studentController.matricNoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Matric Number',
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
        SizedBox(height: 20,),
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
                    controller: _studentController.DeptController,
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
        SizedBox(height: 20,),

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
                    controller: _studentController.levelController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Level',
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
        SizedBox(height: 20,),
        ElevatedButton(
            onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    context: context,
                    builder: (context) => Container(
                        padding: EdgeInsets.all(16),
                        child:AttendanceFailed(
                          title: 'Overwrite',
                        )

                )
                );

            },
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
                fontFamily: GoogleFonts.openSans().fontFamily,
              ),
            ),

        )

      ],
    );
  }
}
