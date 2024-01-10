import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  const QRCode({super.key});
  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
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
