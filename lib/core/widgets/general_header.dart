import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/general_text.dart';

class GeneralHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const GeneralHeader({super.key, required this.title, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed:onTap ??  () => context.pop(),
        ),
        GeneralText(
          text: title,
          sizeText: size.width * 0.05,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),

        /// لو لم يتم تمرير ويدجت لن يظهر شيء
        if (trailing != null) trailing!,
      ],
    );
  }
}
