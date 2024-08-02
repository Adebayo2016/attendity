import 'package:attendity/controller/HomeController/Lecturer/LecturerHomeController.dart';
import 'package:attendity/controller/LoginController/login_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'QRCode.dart';

class TopContainer extends StatefulWidget {
  const TopContainer({super.key});

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    final LoginController _loginController = Get.put(LoginController());
    final LecturerHomeController _lecturerHomeController =
        Get.put(LecturerHomeController());
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mas.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            border: Border.all(),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome, ${_loginController.lecturername}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A1A),
                            fontFamily: GoogleFonts.openSans().fontFamily,
                          ),
                        ),
                        SvgPicture.asset('assets/images/prof.svg'),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
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
                            Text("Next Class",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1A1A1A),
                                  fontFamily: GoogleFonts.openSans().fontFamily,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text("IFT501"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        var myCourses=_loginController.allLecturerCourses;
                        showBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: myCourses.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(myCourses[index]['name']),
                                      onTap: () {
                                      Get.to(()=>QRCode(ClassName: myCourses[index]['name'],));
                                       //Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                ),
                              );
                            });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFF000000),
                            border: Border.all(
                              color: Color(0xFF97BCE8),
                            ),
                          ),
                          height: 160.sp,
                         // width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Instant Class",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    "Create a new instance class and start taking attendance",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                                SizedBox(
                                  height: 60.sp,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Start now',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),

                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFFF592D),
                    border: Border.all(
                      color: Color(0xFFFF592D),
                    ),
                  ),
                  height: 97.sp,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Attendance History",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "View all your attendance history for all your Student ",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('View now',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 10,
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
