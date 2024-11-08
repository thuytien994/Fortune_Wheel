import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class GenBarcode extends StatelessWidget {
  const GenBarcode({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a DataMatrix barcode

    return Scaffold(
      body: SizedBox(
        height: 300,
        width: 300,
        child: SfBarcodeGenerator(
          value: 'https://spin.kenbar.vn/',
        ),
      ),
    );
  }
}
