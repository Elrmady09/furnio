import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnio/features/profile/logic/add_new_card_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/input_formatters/expiry_date_formatter.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/inputs/general_textfield.dart';
import '../../../../../core/widgets/space.dart';

class NewCardInput extends StatelessWidget {
  const NewCardInput({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<AddNewCardProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          text: 'Card Number',
          sizeText: size.width * 0.04,
          fontWeight: FontWeight.w500,
        ),
        HeightSpace1(space: 5),
        GeneralTextField(
          textEditingController: provider.controller(CardField.number),
          hasError: provider.error(CardField.number) != null,
          formatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
          ],
        ),
        HeightSpace1(space: 15),
        GeneralText(
          text: 'Card Name',
          sizeText: size.width * 0.04,
          fontWeight: FontWeight.w500,
        ),
        HeightSpace1(space: 5),
        GeneralTextField(
          textEditingController: provider.controller(CardField.name),
          hasError: provider.error(CardField.name) != null,
          formatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
            LengthLimitingTextInputFormatter(20),
          ],
        ),
        HeightSpace1(space: 15),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    text: 'Exp Date',
                    sizeText: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                  HeightSpace1(space: 5),
                  GeneralTextField(
                    textEditingController: provider.controller(CardField.expDate),
                    hasError: provider.error(CardField.expDate) != null,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateFormatter(),
                    ],
                  ),
                ],
              ),
            ),
            WidthSpace(space: 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralText(
                    text: 'CVV',
                    sizeText: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                  HeightSpace1(space: 5),
                  GeneralTextField(
                    textEditingController: provider.controller(CardField.cvv),
                    hasError: provider.error(CardField.cvv) != null,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),

        HeightSpace1(space: 30),
      ],
    );
  }
}
