import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/inputs/general_profile_inputs.dart';
import '../../../../account_setup/logic/account_setup_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AccountSetupProvider>();

    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: AppPadding.pagePadding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GeneralHeader(title: 'Edit Profile'),
                HeightSpace(space: 0.05),
                GeneralProfileInputs(),
                HeightSpace(space: 0.18),
                GeneralButton(
                  text: 'Continue',
                  onTap: () async {
                    final ok = provider.validateInputs();
                    if (!ok) {
                      final messages =
                          provider.fullNameError ??
                              provider.nickNameError ??
                              provider.dateError ??
                              provider.emailError ??
                              provider.phoneNumberError ??
                              "error";
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(messages), backgroundColor: Colors.red),
                      );
                      return; // مهم
                    }
                    //context.push('/NewPinPage');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Edit Profile Success')),
                    );

                  },

                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
