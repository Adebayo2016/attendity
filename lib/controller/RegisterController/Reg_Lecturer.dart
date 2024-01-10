import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegLecturer extends GetxController{
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
  CollectionReference lecturer = FirebaseFirestore.instance.collection('users');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController FullNamesController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController CourseController = TextEditingController();
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
    String? userEmail=emailController.text;
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
    String? userEmail=emailController.text;
    String? fullNames=FullNamesController.text;
    String? phone=PhoneController.text;
    String? department=DepartmentController.text;
    String? course=CourseController.text;
    try {
      await lecturer.doc(userEmail).set({
        'email': userEmail,
        'FullNames': fullNames,
        'Phone': phone,
        'Department': department,
        'accountType': 0,
         'course':course,
      }).then((value){
        Get.snackbar('Success',
            'Data Saved Successfully',snackPosition: SnackPosition.BOTTOM);
      }).catchError((error) => Get.snackbar('Error', error.toString(),snackPosition: SnackPosition.BOTTOM));
    } catch (e) {
      print(e);
    }
  }

}