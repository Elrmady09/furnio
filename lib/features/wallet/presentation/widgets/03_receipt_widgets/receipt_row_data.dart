import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';

class ReceiptRowData extends StatelessWidget {
  const ReceiptRowData({
    super.key,
    required this.title,
    this.value,
    this.showPaid = false,
  });

  final String title;
  final String? value;
  final bool showPaid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralText(
            text: title,
            sizeText: size.width * 0.038,
            fontWeight: FontWeight.w400,
          ),
          if (showPaid)...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: 2.5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(size.width * 0.015),
              ),
              child:GeneralText(
                color: Colors.white,
                text: 'Paid',
                sizeText: size.width * 0.035,
                fontWeight:FontWeight.w500 ,
              ) ,
            ),
          ]else
            GeneralText(
              text: '$value',
              sizeText: size.width * 0.04,
              fontWeight:FontWeight.w700 ,
            ),
        ],
      ),
    );
  }
}
