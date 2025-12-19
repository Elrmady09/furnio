import 'package:flutter/material.dart';
import '../../../../core/widgets/general_text.dart';

class ContactOptionItem extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const ContactOptionItem({
    super.key,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:size.width * 0.04,vertical: size.height * 0.036),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.04),
          border: Border.all(
            color: selected ? Colors.black : Colors.transparent,
          ),
          color: Colors.grey.shade100,
        ),
        child: Row(
          children: [
            CircleAvatar(radius:size.width * 0.065,backgroundColor: Colors.grey.shade300,child: Icon(icon,color: Colors.black,),),
            SizedBox(width: size.width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralText(text: title),
                GeneralText(text: subtitle, sizeText: size.width * 0.035),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
