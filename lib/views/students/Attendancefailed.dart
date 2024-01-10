import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../util/status.dart';

class AttendanceFailed extends StatelessWidget {
  final String? title;
  const AttendanceFailed({super.key, this.title,});
  @override
  Widget build(BuildContext context) {

    return StatusWidget(
      alertTitle: Text(
        'Warning',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      alertSubtitle: Text('you have been marked present already , do you wish to overwrite this Attendance?'),
      alertType: RichAlertType.WARNING,
      actions: [
        GestureDetector(
          onTap: () {
          },
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.greenAccent,
            ),
            child: Center(child: Text(title!)),
          ),
        )
      ],
    );
  }


}
