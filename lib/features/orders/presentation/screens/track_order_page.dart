import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/track_order_provider.dart';
import '../widgets/02_track_order_widgets/track_order_progress.dart';
import '../widgets/02_track_order_widgets/track_order_status_timeline.dart';
import '../widgets/order_card.dart';


class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<TrackOrderProvider>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              GeneralHeader(title: 'Track Order'),

              OrderCard(
                item: {
                  'item': [provider.selectedProduct],
                },
                showStatus: false,
                showTrackButton: false,
              ),
              /// Packet In Delivery
              TrackOrderProgress(currentStep: 1,),
              GeneralText(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                text: 'Order Status Details',
                sizeText: size.width * 0.045,
                fontWeight: FontWeight.w700,
              ),

              /// Order Status
              Expanded(
                child: Consumer<TrackOrderProvider>(
                  builder: (_, provider, __) {
                    return TrackOrderStatusTimeline(
                      items: provider.statusList,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
