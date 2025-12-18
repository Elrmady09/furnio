import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/account_setup/data/countries_data.dart';
import 'features/account_setup/logic/account_setup_provider.dart';

// class TextImageDropdown extends StatefulWidget {
//   @override
//   State<TextImageDropdown> createState() => _TextImageDropdownState();
// }
//
// class _TextImageDropdownState extends State<TextImageDropdown> {
//   int selectedIndex = 0;
//   String selectedText = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<int>(
//                 value: selectedIndex,
//                 items: List.generate(itemCountries.length, (index) {
//                   return DropdownMenuItem<int>(
//                     value: index,
//                     child: Row(
//                       children: [
//                         Image.asset(itemCountries[index]["icon"],height: 25,),
//                         const SizedBox(width: 8),
//                         Text(itemCountries[index]["text"]),
//                       ],
//                     ),
//                   );
//                 }),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedIndex = value!;
//                     selectedText = itemCountries[value]["text"];
//                   });
//                 },
//               ),
//             ),
//           ),
//           /// زر الطباعة
//           ElevatedButton(
//             onPressed: () {
//               setState(() {});
//             },
//             child: const Text("عرض الاختيار"),
//           ),
//
//           const SizedBox(height: 20),
//
//           /// عرض الاختيار على الشاشة
//           if (selectedText.isNotEmpty)
//             Text(
//               "الاختيار هو: $selectedText",
//               style: const TextStyle(fontSize: 18),
//             ),
//         ],
//       ),
//     );
//   }
// }



class TextImageDropdown extends StatelessWidget {
  const TextImageDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AccountSetupProvider>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Dropdown
          // DropdownButtonHideUnderline(
          //   child: DropdownButton<int>(
          //     value: provider.selectedIndex,
          //     isExpanded: true,
          //     menuMaxHeight: 300,
          //     items: List.generate(itemCountries.length, (index) {
          //       return DropdownMenuItem<int>(
          //         value: index,
          //         child: Row(
          //           children: [
          //             Image.asset(
          //               itemCountries[index]["flag"],
          //               height: 25,
          //             ),
          //             const SizedBox(width: 8),
          //             Text(itemCountries[index]["code"]),
          //           ],
          //         ),
          //       );
          //     }),
          //     onChanged: (value) {
          //       provider.selectedIndex = value!;
          //       provider.changeCountry(itemCountries[value]["code"]);
          //       provider.changeFlag(itemCountries[value]["flag"]);
          //     },
          //   ),
          // ),
          Container(
            width: 150,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                value: provider.selectedIndex,
                isExpanded: true,

                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  //direction: DropdownDirection., // 👈 الحل السحري
                ),

                items: List.generate(itemCountries.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Row(
                      children: [
                        Image.asset(itemCountries[index]["flag"], height: 25),
                        const SizedBox(width: 8),
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

          const SizedBox(height: 20),

          /// زر الطباعة
          ElevatedButton(
            onPressed: () {
              print("الدولة: ${provider.selectedCountry}");
              print("العلم: ${provider.selectedFlag}");
            },
            child: const Text("عرض الاختيار"),
          ),

          const SizedBox(height: 20),

          /// عرض القيم على الشاشة
          if (provider.selectedCountry.isNotEmpty)
            Column(
              children: [
                Text(
                  "الدولة المختارة: ${provider.selectedCountry}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  provider.selectedFlag,
                  height: 30,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
