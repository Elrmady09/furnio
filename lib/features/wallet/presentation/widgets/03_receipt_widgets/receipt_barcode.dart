import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:furnio/features/wallet/presentation/widgets/03_receipt_widgets/receipt_barcode_item.dart';

class ReceiptBarcode extends StatelessWidget {
  const ReceiptBarcode({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Image.asset('assets/image/wallet/barcode.png',scale: 4.2),
          Expanded(
            child: Container(
              height: 150,
              margin: EdgeInsets.only(left: size.width * 0.01),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.025,vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * 0.04),
              ),
              child:Column(
                children: [
                  ReceiptBarcodeItem(image: 'assets/image/wallet/share.png', title: 'Share E-Receipt',),
                  Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
                  HeightSpace1(space: 5),
                  ReceiptBarcodeItem(image: 'assets/image/wallet/download.png', title: 'Download E-Receipt',),
                  Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
                  HeightSpace1(space: 5),
                  ReceiptBarcodeItem(image: 'assets/image/wallet/print.png', title: 'Print',),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
