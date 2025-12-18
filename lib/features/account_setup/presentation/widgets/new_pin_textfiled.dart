import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewPinTextFiled extends StatelessWidget {
  const NewPinTextFiled({super.key, this.controller, this.textInputType, this.validate, this.focusNode, this.onChanged});
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.17,
      height: size.height * 0.095,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: TextFormField(
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
          controller: controller,
          focusNode:focusNode,
          validator: validate,
          keyboardType:TextInputType.number,
          onChanged: onChanged,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
          ),



        ),
      ),
    );
  }
}