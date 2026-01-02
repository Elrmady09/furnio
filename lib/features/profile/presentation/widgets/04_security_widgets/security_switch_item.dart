import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';

class SecuritySwitchItem extends StatelessWidget {
  const SecuritySwitchItem({
    super.key,
    required this.title,
    this.value,
    this.onChanged,
    this.showSwitch = true,
  });

  final String title;
  final bool? value;
  final Function(bool)? onChanged;
  final bool showSwitch;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Row(
        children: [
          Expanded(
            child: GeneralText(
              text: title,
              sizeText: size.width * 0.04,
            ),
          ),
          if(showSwitch)...[
            Switch(
              value: value!,
              onChanged: onChanged,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey[300],
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              trackOutlineWidth: MaterialStateProperty.all(0),

            ),
          ]else...[
            Icon(Icons.arrow_forward_ios,size: size.width * 0.05,),
          ]

        ],
      ),
    );
  }
}
