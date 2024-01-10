import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {

  final String? ClassName;
  const QRCode({super.key,  this.ClassName});
  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            child: Center(
              child: Text(
                widget.ClassName!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),
          SizedBox(height: 27,),
          Center(
            child: QrImageView(
              data: "5y6Gt5iRmXN10eywvYyU",
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),


        ],
      ),

    );


  }



}
