import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../../account_setup/presentation/widgets/new_pin_textfiled.dart';
import '../../logic/pin_provider.dart';
import '../widgets/pin_input.dart';



class PinPage extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onComplete;

  const PinPage({
    super.key,
    required this.title,
    required this.description,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PinProvider>();
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: provider.unFocusAll,
        child: Scaffold(
          body: Padding(
            padding: AppPadding.pagePadding(context),
            child: Column(
              children: [
                GeneralHeader(title: title),
                HeightSpace(space: 0.1),
                GeneralText(
                  textAlign: TextAlign.center,
                  text: description,
                  sizeText: size.width * 0.04,
                ),

                HeightSpace(space: 0.1),

                PinInput(),

                Spacer(),

                GeneralButton(
                  text: 'Continue',
                  onTap: onComplete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
