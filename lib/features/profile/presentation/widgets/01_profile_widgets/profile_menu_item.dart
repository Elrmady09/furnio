import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.trailingText,
    this.color,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final String? trailingText;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: color ),
      title: GeneralText(
        text: title,
        sizeText: size.width * 0.04,
        color: color,
      ),
      trailing: trailingText != null
          ? GeneralText(
        text: trailingText!,
        sizeText: size.width * 0.035,
        color: Colors.grey,
      )
          : const Icon(Icons.chevron_right),
    );
  }
}
