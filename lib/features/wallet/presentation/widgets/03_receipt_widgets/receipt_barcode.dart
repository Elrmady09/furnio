import 'package:flutter/material.dart';
import 'package:furnio/features/wallet/presentation/widgets/03_receipt_widgets/receipt_barcode_item.dart';

class ReceiptBarcode extends StatelessWidget {
  const ReceiptBarcode({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: Row(
        children: [
          Image.asset('assets/image/wallet/barcode.png',scale: size.width * 0.01,),
          Expanded(
            child: Container(
              height: size.height * 0.2,
              margin: EdgeInsets.only(left: size.width * 0.03),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.012),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * 0.04),
              ),
              child:Column(
                children: [
                  ReceiptBarcodeItem(image: 'assets/image/wallet/share.png', title: 'Share E-Receipt',),
                  Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
                  ReceiptBarcodeItem(image: 'assets/image/wallet/download.png', title: 'Download E-Receipt',),
                  Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
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
