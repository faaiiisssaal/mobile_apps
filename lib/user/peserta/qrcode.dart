import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ClientQRCode extends StatefulWidget {
  const ClientQRCode({super.key});

  @override
  State<ClientQRCode> createState() => _ClientQRCodeState();
}

class _ClientQRCodeState extends State<ClientQRCode> {
  String qrResult = "Scanned Data Will Be Applied Here";

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode("ff6666", "Cancel", true, ScanMode.QR);

      if (!mounted) {
        return;
      }

      setState(() {
        qrResult = qrCode.toString();
      });
    } on PlatformException{
      qrResult = "Fail to read QR Code";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: scanQRCode,

        child: const Text("Touch Me"),
      ),
    );
  }
}
