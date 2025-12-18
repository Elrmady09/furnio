import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/new_pin_provider.dart';
import '../widgets/account_header.dart';
import '../widgets/new_pin_textfiled.dart';


class CreateNewPinPage extends StatelessWidget {
  const CreateNewPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewPinProvide>(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: provider.unFocusAll,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.02),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  /// Header
                  AccountHeader(title: 'Create New PIN'),
                  HeightSpace(space: 0.1),
                  /// Text
                  GeneralText(
                    textAlign: TextAlign.center,
                    text: 'Add a PIN number to make your account\nmore secure',
                    sizeText: size.width * 0.04,
                  ),
                  HeightSpace(space: 0.1),
                  /// PIN Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NewPinTextFiled(
                        controller: provider.first,
                        focusNode: provider.firstNode,
                        onChanged: (v) {
                          if (v.length == 1) {
                            provider.next(provider.firstNode, provider.secondNode);
                          }
                        },
                      ),
                      NewPinTextFiled(
                        controller: provider.second,
                        focusNode: provider.secondNode,
                        onChanged: (v) {
                          if (v.length == 1) {
                            provider.next(provider.secondNode, provider.thirdNode);
                          }
                        },
                      ),
                      NewPinTextFiled(
                        controller: provider.third,
                        focusNode: provider.thirdNode,
                        onChanged: (v) {
                          if (v.length == 1) {
                            provider.next(provider.thirdNode, provider.fourthNode);
                          }
                        },
                      ),
                      NewPinTextFiled(
                        controller: provider.fourth,
                        focusNode: provider.fourthNode,
                        onChanged: (v) {
                          if (v.length == 1) {
                            provider.unFocusAll();
                            // Navigator.pushNamed(
                            //     context, RouteNames.selectRecipent);
                          }
                        },
                      ),
                    ],
                  ),
                  HeightSpace(space: 0.38),
                  /// Button
                  GeneralButton(
                    text: 'Continue',
                    onTap: (){
                      context.go('/fingerprint');
                    },

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
