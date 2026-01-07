import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/inputs/general_profile_inputs.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/account_setup_provider.dart';
import '../widgets/account_header.dart';
import '../widgets/profile_image_picker.dart';

class FillProfilePage extends StatelessWidget {
  const FillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<AccountSetupProvider>();


    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.03,vertical: size.height * 0.02),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:Column(
                  children: [
                    AccountHeader(title: 'Fill Your Profile'),
                    HeightSpace1(space:5),
                    ProfileImagePicker(),
                    HeightSpace1(space:25),
                    GeneralProfileInputs(),



                  ],
                ),
              ),

              SliverFillRemaining(
                hasScrollBody: false,
                child:Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GeneralButton(
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
                        try {
                          await context.read<AccountSetupProvider>().submitProfile();
                          context.push('/accountSetupPin');
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Something went wrong in pick image')),
                          );
                        }
                      },

                    ),
                  ),
                ),
              ),


            ]
          ),
        ),
      ),
    );
  }
}
