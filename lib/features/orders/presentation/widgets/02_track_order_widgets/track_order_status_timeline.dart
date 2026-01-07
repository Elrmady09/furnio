import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';


class TrackOrderStatusTimeline extends StatelessWidget {
  final List<Map<String, String>> items;

  const TrackOrderStatusTimeline({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.radio_button_checked, size: size.width * 0.07),
              WidthSpace(space: 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GeneralText(
                      text: item['title']!,
                      sizeText: size.width * 0.038,
                      fontWeight: FontWeight.w600,
                    ),
                    HeightSpace1(space: 4),
                    GeneralText(
                      text: item['address']!,
                      sizeText: size.width * 0.03,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              GeneralText(
                text: item['time']!,
                sizeText: size.width * 0.028,
                color: Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }
}
