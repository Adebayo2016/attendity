import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';
  var isPasswordVisible = false;
  var isRememberMe = false;
  var isLogin = false;
  var isEmailValid = false;
  var isPasswordValid = false;
  var isFormValid = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
}