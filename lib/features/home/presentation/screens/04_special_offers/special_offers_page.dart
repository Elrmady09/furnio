import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';

import '../../../data/special_offers_data.dart';
import '../../widgets/00_general_home_widgets/general_home_special_offer.dart';

class SpecialOffersPage extends StatelessWidget {
  const SpecialOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.pagePadding(context),
            child: Column(
              children: [
                GeneralHeader(title: 'SpecialOffer',trailing: Icon(Icons.list)),
                HeightSpace1(space: 12),
                GeneralHomeSpecialOffer(offers: itemSpecialOffers_25, controllerKey: '25',),
                GeneralHomeSpecialOffer(offers: itemSpecialOffers_15, controllerKey: '15',),
                GeneralHomeSpecialOffer(offers: itemSpecialOffers_30, controllerKey: '30',),
                GeneralHomeSpecialOffer(offers: itemSpecialOffers_20, controllerKey: '20',),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
