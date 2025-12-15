
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class GeneralTextField extends StatelessWidget {
  const GeneralTextField({super.key, this.textEditingController, this.onSubmitted, this.onChanged, this.focusNode, this.onTap, this.hintText, this.formatters,this.hasError = false, this.obscureText, this.suffixIcon, this.prefixIcon,});
  final String? hintText;
  final TextEditingController? textEditingController;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? formatters;
  final bool hasError; // ← مجرد true/false
  final bool? obscureText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01,),
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Light background color
        borderRadius: BorderRadius.circular(size.width * 0.02),
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
          contentPadding: EdgeInsets.only(top: size.height * 0.018),
          prefixIcon: Icon(prefixIcon),
          suffixIcon:Icon(suffixIcon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500), // Light text color
          border: InputBorder.none, // Removes underline
        ),
      ),
    );
  }
}
