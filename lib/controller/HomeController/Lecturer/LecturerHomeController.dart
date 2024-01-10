import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../util/networkError.dart';
import '../../LoginController/login_Controller.dart';

class LecturerHomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference allCourses =
      FirebaseFirestore.instance.collection('courses');
  CollectionReference allLectures =
      FirebaseFirestore.instance.collection('lectures');
  CollectionReference allStudents =
      FirebaseFirestore.instance.collection('students');
  List<Map<String, dynamic>> allLecturerCourses = [];

  @override
  void onInit() {
    getAllMyCourses();
    super.onInit();
  }

  final _LoginController = Get.put(LoginController());

  createLecture() {
    DateTime now = DateTime.now();
    var day = now.day.toString();
    print('create lecture');
  }

  getAllMyLectures() {
    print('get all my lectures');
  }

  getTodayLectures() {
    print('get today lectures');
  }

  getMyCurrentLocation() {
    print('get my current location');
  }

  generateLectureQRCode() {
    print('generate lecture QR code');
  }

  printLectureQrCode() {
    print('print lecture QR code');
  }

  getAttendanceReport() {
    print('get attendance report');
  }

  getSingleStudentAttendanceReport() {
    print('get single student attendance report');
  }

  getSingleLectureAttendanceReport() {
    print('get single lecture attendance report');
  }

  getAllMyCourses() async {
    allLecturerCourses = _LoginController.allLecturerCourses;
    DateTime now = DateTime.now();
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    String dayOfWeekString = daysOfWeek[now.weekday - 1];

    print('today is $dayOfWeekString');
    update();
  }

  showConfirmDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Confirm',
      middleText: 'Are you sure you want to start the class ? ',
      textConfirm: 'Yes',
      textCancel: 'No',
      // confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        //Get.offAllNamed('/login');
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
