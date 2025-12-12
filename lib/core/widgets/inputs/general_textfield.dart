
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnio/core/widgets/space.dart';
import '../general_text.dart';

class GeneralTextField extends StatelessWidget {
  const GeneralTextField({super.key, this.textEditingController, this.onSubmitted, this.onChanged, this.focusNode, this.onTap, required this.text, this.hintText, this.formatters,this.hasError = false, this.sizeTitle, this.colorTitle, this.obscureText,});
  final String text;
  final String? hintText;
  final TextEditingController? textEditingController;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? formatters;
  final bool hasError; // ← مجرد true/false
  final double? sizeTitle;
  final Color? colorTitle;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          //padding: EdgeInsets.symmetric(horizontal: size.width * 0.000),
          text: text,
          sizeText:sizeTitle ?? size.width * 0.04 ,
          color: colorTitle,
          fontWeight: FontWeight.bold,
        ),
        HeightSpace(space: 0.01),
        Container(
          height: size.height * 0.066,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Light background color
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hasError ? Colors.red : Colors.transparent,
              width: hasError ? 1 : 0,
            ),
          ),
          child: TextField(
            controller: textEditingController,
            textInputAction: TextInputAction.search,
            inputFormatters: formatters,
            onSubmitted:onSubmitted ,
            onChanged:onChanged ,
            focusNode: focusNode,
            obscureText:obscureText ?? false,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500), // Light text color
              border: InputBorder.none, // Removes underline
            ),
          ),
        ),
        HeightSpace(space: 0.02),
      ],
    );
  }
}
