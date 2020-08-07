import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';

class QrCode {
  String code = "";

  Future scanQr() async {
    String result = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "cancel", true, ScanMode.QR);
    code = result;

    return code;
  }
}
