import 'package:attendity/controller/HomeController/home_Controller.dart';
import 'package:attendity/views/home.dart';
import 'package:attendity/views/lecturer/LecturerPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../util/networkError.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';
  var isPasswordVisible = false;
  var isRememberMe = false;
  var isLogin = false;
  var isEmailValid = false;
  var isPasswordValid = false;
  var isFormValid = false;
  String lecturername = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference data = FirebaseFirestore.instance.collection('users');
  List<Map<String, dynamic>> allLecturerCourses = [];

  void onEmailChanged(String text) {
    email = text;
    isEmailValid = validateEmail(text);
    update();
  }

  void onPasswordChanged(String text) {
    password = text;
    isPasswordValid = validatePassword(text);
    update();
  }

  void onRememberMeChanged(bool value) {
    isRememberMe = value;
    update();
  }

  void onLoginButtonPressed() {
    isLogin = true;
    update();
  }

  void onPasswordVisibilityPressed() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateForm() {
    if (isEmailValid && isPasswordValid) {
      return true;
    }
    return false;
  }

  void Login(BuildContext context) async {
    String? userEmail = emailController.text;
    String? userPassword = passwordController.text;
    startLoading(context);
    try {
      await auth
          .signInWithEmailAndPassword(email: userEmail, password: userPassword)
          .whenComplete(() async {
        getUserDetails();
        loadingSuccessful("success");
      });
      // Get.to(() => MainApp());
    } on FirebaseAuthException catch (e) {
      print("this is firebase error " + e.toString());
      loadingFailed(e, context);

      // return false;
    } catch (e) {}
  }

  getUserDetails() {
    var user = auth.currentUser;
    var uid = user!.email;
    data.doc(uid).get().then((value) {
      lecturername = value['FullNames'];
      var accountType = value['accountType'];
      if (value['accountType'] == 1) {
        print("AccountType is this  $accountType");
        Get.to(() => const HomePage());
      } else {
        getAllMyCourses();
        // Get.to(() => LecturerPage());
      }
      update();
    });
  }

  void getAllMyCourses() async {
    try {
      startLoading(Get.context!);
      await FirebaseFirestore.instance
          .collection('courses')
          .where('lecturerName', isEqualTo: 'Dr. olotu')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isEmpty) {
          loadingSuccessful(null);
        } else {
          loadingSuccessful(null);
          snapshot.docs.forEach((element) {
            allLecturerCourses.add(element.data());
            print("All Lecturer Courses are  " + allLecturerCourses.toString());
            Get.to(() => HomePage());
          });
        }
      });
    } catch (e) {
      loadingFailed("an error occurred");
      print(e.toString());
    }
  }
}
