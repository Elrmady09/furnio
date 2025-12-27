import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnio/features/pin/logic/pin_provider.dart';
import 'package:provider/provider.dart';


class PinInput extends StatelessWidget {
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<PinProvider>();
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Container(
          width: size.width * 0.17,
          height: size.height * 0.095,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(
              //   color:provider.focusNodes[index].hasFocus ? Colors.black : Colors.transparent,
              //   width: size.width * 0.008,
              // )
          ),
          child: Center(
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event){
                if (event is KeyDownEvent  &&
                    event.logicalKey == LogicalKeyboardKey.backspace) {
                  provider.onBackspace(index);
                }
              },
              child: TextField(
                style: TextStyle(fontSize: size.width * 0.055,fontWeight: FontWeight.bold),
                controller: provider.controllers[index],
                focusNode: provider.focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onChanged: (value){
                  provider.onPinInput(index,value);
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
