import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';

import '../../widgets/03_receipt_widgets/receipt_amount_paid.dart';
import '../../widgets/03_receipt_widgets/receipt_barcode.dart';
import '../../widgets/03_receipt_widgets/receipt_details_row.dart';
import '../../widgets/03_receipt_widgets/receipt_product.dart';
import '../../widgets/03_receipt_widgets/receipt_type.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GeneralHeader(title: 'E-Receipt',trailing: Icon(Icons.list),),
                ReceiptBarcode(),
                ReceiptProduct(),
                ReceiptAmountPaid(),
                HeightSpace1(space: 14),
                ReceiptDetailsRow(),
                HeightSpace1(space: 14),
                ReceiptType(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
