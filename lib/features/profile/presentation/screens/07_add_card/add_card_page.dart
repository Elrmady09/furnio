import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../logic/add_new_card_provider.dart';
import '../../widgets/03_new_card_widgets/new_card_image_card.dart';
import '../../widgets/03_new_card_widgets/new_card_input.dart';


class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GeneralHeader(title: 'Add New Card'),
                    NewCardImageCard(),
                    NewCardInput(),

                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GeneralButton(
                    verticalPadding: 10,
                      onTap: (){
                        final provider = context.read<AddNewCardProvider>();
                        final isValid = provider.validateCardInputs();

                        if (!isValid) {
                          final messages = provider.getAllErrors().join('/');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(messages),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        provider.clearCardInputs();
                        context.pop();

                      },
                      text: 'Add'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
