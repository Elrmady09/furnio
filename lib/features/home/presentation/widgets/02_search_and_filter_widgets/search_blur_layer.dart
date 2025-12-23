import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/home_provider.dart';
import '../../../logic/search_provider.dart';


class SearchBlurLayer extends StatelessWidget {
  const SearchBlurLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    if (!provider.isSearching) return const SizedBox();

    return GestureDetector(
      onTap: () {
        provider.closeSearch();
        FocusScope.of(context).unfocus();
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
    );
  }
}
