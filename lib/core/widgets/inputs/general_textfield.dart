
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class GeneralTextField extends StatelessWidget {
  const GeneralTextField({super.key, this.textEditingController, this.onSubmitted, this.onChanged, this.focusNode, this.onTap, this.hintText, this.formatters,this.hasError = false, this.obscureText, this.suffixIcon, this.prefixIcon, this.colorHintText, this.readOnly, this.colorTextFiled,});
  final String? hintText;
  final TextEditingController? textEditingController;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? formatters;
  final bool hasError; // ← مجرد true/false
  final bool? obscureText;
  final bool? readOnly;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Color? colorHintText;
  final Color? colorTextFiled;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bool hasIcon = prefixIcon != null || suffixIcon != null;
    final bool isFocused = focusNode?.hasFocus ?? false;
    final bool hasText = textEditingController?.text.isNotEmpty ?? false;
    final Color iconColor =
    (isFocused || hasText) ? Colors.black : Colors.grey;

    return Container(
      height: size.height * 0.07,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01,),
      decoration: BoxDecoration(
        color: colorTextFiled ?? Colors.grey.shade100, // Light background color
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
        readOnly:readOnly ?? false ,
        style: TextStyle(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding: hasIcon ? EdgeInsets.only(top: size.height * 0.018,left: size.width * 0.03) : EdgeInsets.only(left: size.width * 0.03),
          prefixIcon:prefixIcon != null ? Icon(prefixIcon,color: iconColor,) : null,
          suffixIcon:suffixIcon != null ? Icon(suffixIcon,color: iconColor) : null,
          hintText: hintText,
          hintStyle: TextStyle(color: colorHintText ?? Colors.grey.shade500,fontWeight: FontWeight.w500), // Light text color
          border: InputBorder.none, // Removes underline
        ),
      ),
    );
  }
}
