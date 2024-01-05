import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

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
    String? userEmail=emailController.text;
    String? userPassword=passwordController.text;
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
    } catch (e) {

    }
  }
  getUserDetails(){
    print("i am here ");
  }
}