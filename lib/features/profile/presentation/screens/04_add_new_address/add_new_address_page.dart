import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:furnio/core/widgets/inputs/general_textfield.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:furnio/features/profile/logic/profile_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../cart_and_checkout/data/01_shipping_address/shipping_address_data.dart';

class AddNewAddressPage extends StatelessWidget {
  const AddNewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.read<ProfileProvider>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralHeader(title: 'Add New Address',trailing: Icon(Icons.list),),
              HeightSpace(space: 0.03),
              GeneralText(
                padding: EdgeInsets.only(bottom: size.height * 0.015),
                text: 'Name Address',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w700,
              ),
              GeneralTextField(
                textEditingController:provider.addressController,
              ),
              HeightSpace(space: 0.03),
              GeneralText(
                padding: EdgeInsets.only(bottom: size.height * 0.015),
                text: 'Address Details',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w700,
              ),
              GeneralTextField(
                textEditingController: provider.addressDetailsController,
              ),
              Spacer(),
              GeneralButton(
                onTap: (){
                  provider.addNewAddress(
                      title: provider.addressController.text,
                      subtitle: provider.addressDetailsController.text
                  );
                  provider.clearAddress();
                  context.pop();
                },
                text: 'Add'
              ),

            ],
          ),
        ),
      ),
    );
  }
}
