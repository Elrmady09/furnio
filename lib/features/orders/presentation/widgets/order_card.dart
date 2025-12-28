import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/track_order_provider.dart';
import '02_track_order_widgets/track_order_review_bottom_sheet.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.item,  this.showStatus = true,  this.showTrackButton = true});
  final Map<String, dynamic> item;
  final bool showStatus;
  final bool showTrackButton;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> products =
    List<Map<String, dynamic>>.from(item['item']);
    final bool isDelivery = item['status'] == 'delivery';

    return Column(
      children: products.map((product){
        return Container(
          margin: EdgeInsets.only(bottom: size.height * 0.02),
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.04,vertical: size.height * 0.015),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.width * 0.04),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                width: size.width * 0.27,
                height: size.width * 0.26,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(size.width * 0.04),
                ),
                child: Image.asset(product['image']),
              ),
              WidthSpace(space: 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GeneralText(
                      padding: EdgeInsets.only(bottom: size.height * 0.003),
                      text: product['name'],
                      sizeText: size.width * 0.042,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: size.width * 0.015,
                          backgroundColor: product['color'],
                        ),
                        GeneralText(
                          padding: EdgeInsets.only(left: size.width * 0.02),
                          text: '${product['colorName']}  |  Qty = ${product['quantity']}',
                          sizeText: size.width * 0.03,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                    if(showStatus)...[
                      HeightSpace(space: 0.015),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.025,vertical: size.height * 0.004),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(size.width * 0.01),
                        ),
                        child: GeneralText(
                          text: isDelivery ? 'In Delivery' : 'Completed',
                          sizeText: size.width * 0.03,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    HeightSpace(space: 0.01),
                    Row(
                      children: [
                        GeneralText(
                          text: '\$${product['price']}.00',
                          sizeText: size.width * 0.045,
                          fontWeight: FontWeight.w700,
                        ),
                        Spacer(),
                        if (showTrackButton)
                          GestureDetector(
                            onTap: (){
                              if (isDelivery) {
                                //  خزّن المنتج المختار
                                context.read<TrackOrderProvider>().setProduct(product);
                                context.push('/trackOrder');
                              } else {
                                context.read<TrackOrderProvider>().setProduct(product);
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => const LeaveReviewSheet(),
                                );
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: size.height * 0.005),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(size.width * 0.05),
                              ),
                              child: GeneralText(
                                text: isDelivery ? 'Track Order' : 'Leave Review',
                                sizeText: size.width * 0.036,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
