import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/inputs/general_textfield.dart';
import '../../../../core/widgets/space.dart';
import '../../../features/account_setup/data/countries_data.dart';
import '../../../features/account_setup/logic/account_setup_provider.dart';


class GeneralProfileInputs extends StatelessWidget {
  const GeneralProfileInputs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final provider = context.watch<AccountSetupProvider>();


    return Column(
      children: [
        /// Full Name
        GeneralTextField(
          hintText: 'Full Name',
          textEditingController: provider.fullNameController,
          hasError: provider.fullNameError != null,
          formatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
            LengthLimitingTextInputFormatter(30),
          ],

        ),
        HeightSpace1(space:15),

        /// NickName

        GeneralTextField(
          hintText: 'Nickname',
          textEditingController: provider.nickNameController,
          hasError: provider.nickNameError != null,
        ),
        HeightSpace1(space:15),

        /// Date
        GeneralTextField(
          hintText: 'Date of Birth',
          suffixIcon: Icons.date_range_outlined,
          textEditingController: provider.dobController,
          focusNode: provider.dateFocus,
          hasError: provider.dateError != null,
          readOnly: true,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              provider.dobController.text =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
            }
          },
        ),
        HeightSpace1(space:15),
        /// Email

        GeneralTextField(
          hintText: 'Email',
          suffixIcon: Icons.email_outlined,
          textEditingController: provider.emailController,
          focusNode: provider.emailFocus,
          hasError: provider.emailError != null,
        ),
        HeightSpace1(space:15),
        /// Phone Number

        // Phone with country
        Container(
          height: 50,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(size.width * 0.02),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 110,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    value: provider.selectedIndex,
                    isExpanded: true,
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 150,
                      //direction: DropdownDirection., // 👈 الحل السحري
                    ),
                    items: List.generate(itemCountries.length, (index) {
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Row(
                          children: [
                            Image.asset(itemCountries[index]["flag"], height: size.width * 0.0607),
                            WidthSpace(space: 0.03),
                            Text(itemCountries[index]["code"]),
                          ],
                        ),
                      );
                    }),

                    onChanged: (value) {
                      provider.selectedIndex = value!;
                      provider.changeCountry(itemCountries[value]["code"]);
                      provider.changeFlag(itemCountries[value]["flag"]);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //padding: EdgeInsets.symmetric(horizontal: size.width * 0.04 , vertical: size.height * 0.01),
                    decoration: BoxDecoration(
                    ),
                    child: GeneralTextField(
                      textEditingController: provider.phoneController,
                      hintText:'Phone Number',
                      hasError: provider.phoneNumberError != null,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                      ],

                    )
                ),
              ),
            ],
          ),
        ),
        HeightSpace1(space:15),
        /// Gender
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(size.width * 0.02),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              value: provider.selectedGender,
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                maxHeight: size.height * 0.2,

              ),
              items: ['Male', 'Female']
                  .map(
                    (e) => DropdownMenuItem(value: e, child: Text(e)),
              )
                  .toList(),
              onChanged: provider.changeGender,
            ),
          ),
        ),
      ],
    );
  }
}





