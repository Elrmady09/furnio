import 'package:flutter/material.dart';
import 'package:furnio/features/home/logic/filter_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/space.dart';

class SortAndFilterActions extends StatelessWidget {
  const SortAndFilterActions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SortAndFilterProvider>();
    return Row(
      children: [
        Expanded(
          child: GeneralButton(
            text: 'Reset',
            onTap: provider.reset,
            bgColor: Colors.grey.shade300,
            textColor: Colors.black,
          ),
        ),
        WidthSpace(space: 0.03),
        Expanded(
          child: GeneralButton(
            text: 'Apply',
            onTap: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
