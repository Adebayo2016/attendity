import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../util/status.dart';

class AttendanceSuccess extends StatelessWidget {
  final String? title;
  const AttendanceSuccess({super.key, this.title,});
  @override
  Widget build(BuildContext context) {

    return StatusWidget(
      alertTitle: Text(
        'Successful',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      alertSubtitle: Text('you have been marked present for this class'),
      alertType: RichAlertType.SUCCESS,
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
