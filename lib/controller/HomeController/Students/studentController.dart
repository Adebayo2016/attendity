import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../../util/networkError.dart';

class studentController extends GetxController {
  String? courseId;
  String _deviceID = 'Loading...';
  String name='';
  String Dept="";
  String matricNo= '';
  String level='';

  double lecturerLatitude=0;
  double lecturerLongitude=0;




  TextEditingController nameController = TextEditingController();
  TextEditingController matricNoController = TextEditingController();
  TextEditingController DeptController = TextEditingController();
  TextEditingController levelController = TextEditingController();



  
  @override
  void onInit() {
   _getDeviceID();
    super.onInit();
  }


  String setCourseId(String value ){
    courseId=value;
    return value;
  }

  FirebaseFirestore firestore= FirebaseFirestore.instance;

   Future joinClass() async {
     String name=nameController.text;
      String matricNo=matricNoController.text;
      String Dept=DeptController.text;
      String level=levelController.text;

   Map data = {
        'name':name,
        'matricNo':matricNo,
        'Dept':Dept,
        'time':DateTime.now().toString(),
        'status':'present',
        'level':level,
     };
     
     DocumentReference courseIdRef= FirebaseFirestore.instance.collection('courses').doc(courseId).collection("attendance").doc(_deviceID);
   CollectionReference courseCollection= FirebaseFirestore.instance.collection('courses').doc(courseId).collection('attendance');
   courseIdRef.set(data).then((value) => null);
   }

  Future<void> _getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _deviceID = androidInfo.androidId;
      update();

  }


  joinClassAlertAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Join Class'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to join this class?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                joinClass();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    print('join class alert');
  }

  Future<void> getLocationDifference() async {
    LatLng latLngFromDatabase = LatLng(lecturerLatitude, lecturerLongitude);
     //gets the location of the lecturer student
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

 LatLng studentLocation = LatLng(position.latitude, position.longitude);
    double distanceInMeters = await Geolocator.distanceBetween(
        latLngFromDatabase.latitude,
        latLngFromDatabase.longitude,
        studentLocation.latitude,
        studentLocation.longitude);

    double distanceInKm = distanceInMeters / 1000;

    if (distanceInKm <0.5){
      Get.snackbar('Error', 'You are not in the class location');
    } else{
      Get.snackbar('Success',  'You are in the class location');
    }

    print('Distance between the locations: $distanceInKm km');
  }

  getLocationDatafromCourse() async {
    await firestore.collection('courses').doc(courseId).get().then((value) {
      lecturerLatitude=value['latitude'];
      lecturerLongitude=value['longitude'];
      getLocationDifference();
      update();
    });


  }

}