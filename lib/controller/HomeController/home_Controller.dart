import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

      ShowMarkDialog (BuildContext context) {
        AlertDialog(
          title: Text("Mark as done"),
          content: Text("Are you sure you want to mark  this Attendance ?"),
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text("No"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      }

     SelectMarkOption(){
        Get.defaultDialog(
          title: 'Select Mode',
          content: Text('Are you sure you want to mark this task as done?'),
          textConfirm: 'Location',
          textCancel: 'QrCode',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          },
          onCancel: () {
            Get.back();
          },
        );
     }

      }