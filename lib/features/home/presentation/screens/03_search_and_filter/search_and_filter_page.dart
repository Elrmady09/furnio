import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:furnio/features/home/presentation/widgets/00_general_home_widgets/general_home_search.dart';
import 'package:provider/provider.dart';

import '../../../logic/home_provider.dart';
import '../../../logic/search_provider.dart';
import '../../widgets/00_general_home_widgets/general_home_products_grid.dart';

class SearchAndFilterPage extends StatefulWidget {
  const SearchAndFilterPage({super.key, required this.initialQuery});
  final String initialQuery;

  @override
  State<SearchAndFilterPage> createState() => _SearchAndFilterPageState();
}

class _SearchAndFilterPageState extends State<SearchAndFilterPage> {

  @override
  void initState() {
    super.initState();
    // تنفيذ البحث مباشرة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchProvider>().initSearch(widget.initialQuery);
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final searchProvider = context.watch<SearchProvider>();
    final results = searchProvider.results;

    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          context.read<HomeProvider>().resetSearch();
          return true;

        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeightSpace(space: 0.02),

                  GeneralHomeSearch(
                    textEditingController: searchProvider.searchController,
                    focusNode: searchProvider.searchFocusNode,
                    onSubmitted: searchProvider.search,
                    onTap: (){},


                  ),
                  HeightSpace(space: 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralText(
                        text: 'Results for :${searchProvider.query} ',
                        sizeText: size.width * 0.045,
                        fontWeight: FontWeight.w700,
                      ),
                      GeneralText(
                        text: '${results.length} found',
                        sizeText: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  HeightSpace(space: 0.02),

                  if(results.isEmpty)...[
                    HeightSpace(space: 0.1),
                    Image.asset('assets/image/home/not found image.png',scale: size.width * 0.007,),
                    GeneralText(
                      padding: EdgeInsets.only(top: size.height * 0.04,left: size.width * 0.00),
                      text: 'Not Found',
                      sizeText: size.width * 0.055,
                      fontWeight: FontWeight.w700,
                    ),
                    GeneralText(
                      textAlign: TextAlign.center,
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      text: 'Sorry, the keyword you entered cannot be\nfound, please check again or search with\nanother keyword.',
                      sizeText: size.width * 0.04,

                    ),
                  ],

                  GeneralHomeProductsGrid(itemCount: results.length, products: results,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
