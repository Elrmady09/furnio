import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';

class ProfileSwitchItem extends StatelessWidget {
  const ProfileSwitchItem({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final IconData icon;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListTile(
      leading: Icon(icon),
      title: GeneralText(
        text: title,
        sizeText: size.width * 0.04,
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
