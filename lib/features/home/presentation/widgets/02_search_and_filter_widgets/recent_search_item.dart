import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/home_provider.dart';



class RecentSearchItem extends StatelessWidget {
  final String text;

  const RecentSearchItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    Size size = MediaQuery.of(context).size;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: GeneralText(
        text: text,
        sizeText: size.width * 0.038,
      ),
      trailing: IconButton(
        icon: Icon(Icons.close, size: size.width * 0.045,),
        onPressed: () => provider.removeSearch(text),
      ),
    );
  }
}
