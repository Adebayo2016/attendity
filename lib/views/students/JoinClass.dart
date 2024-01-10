
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controller/HomeController/Students/studentController.dart';

class JoinQRCodeScannerPage extends StatefulWidget {

  const JoinQRCodeScannerPage({super.key});
  @override
  _JoinQRCodeScannerPageState createState() => _JoinQRCodeScannerPageState();
}

class _JoinQRCodeScannerPageState extends State<JoinQRCodeScannerPage> {

  final studentController _studentHomeController = Get.put(studentController());

  bool? isCorrect=false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              // width: 300,
              // height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      var data = scanData.code.toString();
      print('data is $data');

      _studentHomeController.joinClassAlertAlert(context);

      // if (data == _deliveryController.currentDeliveryData!['ride_id'] ){
      //   setState(() {
      //     isCorrect=true;
      //   });
      // }

    });
  }

  //
}
