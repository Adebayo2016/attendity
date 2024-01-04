import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
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
  String? MatricNumber;
  String? Department;
  String? Level;
  int? accountType;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore data = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController FullNamesController = TextEditingController();

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

    auth.createUserWithEmailAndPassword(
        email: email, password: password).
    then((value) => Get.snackbar('Success',
        'Account created successfully',snackPosition: SnackPosition.BOTTOM)
    ).catchError((error) => Get.snackbar('Error', error.toString(),snackPosition: SnackPosition.BOTTOM));

  }

  void saveUserDetails() async {
    try {
      await data.collection('users').doc(email).set({
        'email': email,
        'FullNames': FullNames,
        'Phone': Phone,
        'MatricNumber': MatricNumber,
        'Department': Department,
        'Level': Level,
      });
    } catch (e) {
      print(e);
    }
  }

}