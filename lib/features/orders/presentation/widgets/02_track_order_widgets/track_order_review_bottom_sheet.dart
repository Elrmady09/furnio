import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furnio/core/widgets/general_second_button.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:provider/provider.dart';

import '../../../logic/track_order_provider.dart';
import '../order_card.dart';

class LeaveReviewSheet extends StatelessWidget {
  const LeaveReviewSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<TrackOrderProvider>();

    return Container(
      height: size.height * 0.8,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(size.width * 0.08),
        ),
      ),
      child: Column(

        children: [
          /// drag handle
          Center(
            child: Container(
              width: size.width * 0.15,
              height: size.height * 0.005,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          HeightSpace(space: 0.02),

          /// title
          GeneralText(text: 'Leave a Review',sizeText:size.width * 0.05,fontWeight: FontWeight.w600,),
          HeightSpace(space: 0.02),
          Divider(thickness: size.width * 0.005,color: Colors.grey[300],),
          /// product card
          OrderCard(
            item: {
              'item': [provider.selectedProduct],
            },
            showTrackButton: false,
          ),

          Divider(thickness: size.width * 0.005,color: Colors.grey[300],),

          HeightSpace(space: 0.02),

          /// question
          GeneralText(text: 'How is your order?',sizeText:size.width * 0.05,fontWeight: FontWeight.w600,),
          HeightSpace(space: 0.001),
          GeneralText(text: 'Please give your rating & also your review...',sizeText:size.width * 0.035,color: Colors.grey,),

          /// stars
          RatingBar(
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star, color: Colors.black),
              half: const Icon(Icons.star_half, color: Colors.black),
              empty: const Icon(Icons.star_border, color: Colors.black),
            ),
            initialRating: 3.5,
            minRating: 1,
            allowHalfRating: true,
            itemSize: size.width * 0.08,
            itemPadding: EdgeInsets.symmetric(horizontal: size.width * 0.018,vertical: size.height * 0.025),
            onRatingUpdate: (rating) {},
          ),


          /// text field
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.04),
              border: Border.all(color: Colors.black,width: size.width * 0.004),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Very good product & fast delivery!',
                      hintStyle: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(
                  Icons.image_outlined,
                  size: size.width * 0.06,
                )
              ],
            ),
          ),
          HeightSpace(space: 0.02),
          Divider(thickness: size.width * 0.005,color: Colors.grey[300],),
          HeightSpace(space: 0.02),


          /// buttons
          Row(
            children: [
              Expanded(child: GeneralSecondButton(title: 'Cancel',bgColor:Colors.grey.shade200 ,)),
              WidthSpace(space: 0.05),
              Expanded(child: GeneralSecondButton(title: 'Submit',bgColor: Colors.black,titleColor: Colors.white,)),
            ],
          ),
        ],
      ),
    );
  }
}
