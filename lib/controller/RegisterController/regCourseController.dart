import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegCourseController extends GetxController{
  String email = '';
  String password = '';
  String confirmPassword = '';
  var isPasswordVisible = false;
  var isRememberMe = false;
  var isRegister = false;
  var isEmailValid = false;
  var isPasswordValid = false;
  var isConfirmPasswordValid = false;
  var isFormValid = false;

  String? FullNames;
  String? Phone;
  String? course;
  String? Department;
  int? accountType;
  FirebaseAuth auth = FirebaseAuth.instance;
  //FirebaseFirestore data = FirebaseFirestore.instance.collection('users');
  CollectionReference courseReg = FirebaseFirestore.instance.collection('courses');
  TextEditingController dayController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController lecturerNameController = TextEditingController();
  TextEditingController DepartmentController = TextEditingController();
  TextEditingController LevelController = TextEditingController();

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

  void onConfirmPasswordChanged(String text) {
    confirmPassword = text;
    isConfirmPasswordValid = validateConfirmPassword(text);
    update();
  }

  void onRememberMeChanged(bool value) {
    isRememberMe = value;
    update();
  }

  void onRegisterButtonPressed() {
    isRegister = true;
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

  bool validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  bool validateForm() {
    if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
      return true;
    }
    return false;
  }

  void Register() async {
    String? userEmail=dayController.text;
    String? userPassword=passwordController.text;

    await  auth.createUserWithEmailAndPassword(
        email: userEmail, password: userPassword).
    then((value) async {
      await saveUserDetails();
      Get.snackbar('Success',
          'Account created successfully',snackPosition: SnackPosition.BOTTOM);
    }
    ).catchError((error) => Get.snackbar('Error', error.toString(),snackPosition: SnackPosition.BOTTOM));
  }


  Future<void> saveUserDetails() async {
    print("Saving user details ");
    String? days=dayController.text;
    String? courseName=courseNameController.text;
    String? time=timeController.text;
    String? department=DepartmentController.text;
    String? lecturerName=lecturerNameController.text;
    try {
      await courseReg.doc().set({
        'day': days,
        'name': courseName,
        'time': time,
        'Department': department,
        'lecturerName': lecturerName,
        'level': '500',
      }).then((value){
        Get.snackbar('Success',
            'Data Saved Successfully',snackPosition: SnackPosition.BOTTOM);
      }).catchError((error) => Get.snackbar('Error', error.toString(),snackPosition: SnackPosition.BOTTOM));
    } catch (e) {
      print(e);
    }
  }

}