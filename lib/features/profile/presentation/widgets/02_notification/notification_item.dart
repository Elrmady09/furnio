import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key, required this.title});
  final String title;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Row(
        children: [
          Expanded(
            child: GeneralText(
              text: widget.title,
              fontWeight: FontWeight.w500,
              sizeText: size.width * 0.04,
            ),
          ),
          Switch(
            value: value,
            onChanged: (v) => setState(() => value = v),
          ),
        ],
      ),
    );
  }
}
