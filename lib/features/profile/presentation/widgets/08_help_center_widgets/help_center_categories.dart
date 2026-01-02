// import 'package:flutter/material.dart';
// import 'package:furnio/features/profile/logic/profile_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../core/widgets/general_text.dart';
//
// class HelpCenterCategories extends StatelessWidget {
//   const HelpCenterCategories({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<ProfileProvider>();
//     Size size = MediaQuery.of(context).size;
//
//     final categories = ['General', 'Account', 'Service', 'Payment'];
//
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: categories.map((cat) {
//           final active = provider.selectedCategory == cat;
//
//           return Padding(
//             padding: EdgeInsets.only(right: size.width * 0.02),
//             child: GestureDetector(
//               onTap: () => provider.changeCategory(cat),
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: size.width * 0.04,
//                   vertical: size.height * 0.01,
//                 ),
//                 decoration: BoxDecoration(
//                   color: active ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: GeneralText(
//                   text: cat,
//                   sizeText: size.width * 0.035,
//                   color: active ? Colors.white : Colors.black,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
