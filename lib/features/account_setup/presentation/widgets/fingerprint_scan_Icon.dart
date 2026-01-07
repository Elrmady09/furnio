import 'package:flutter/material.dart';


class FingerprintScanIcon extends StatelessWidget {
  final double progress; // من 0 إلى 100

  const FingerprintScanIcon({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    double percent = (progress / 100).clamp(0.0, 1.0);

    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
          child: Image.asset(
            'assets/image/account_setup/fingerprint.png',
            width: MediaQuery.of(context).size.width * 0.33,
          ),
        ),

        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [
                0.0,
                percent,     // من هنا يبدأ اللون
                percent,     // هنا ينتهي
                1.0
              ],
              colors: [
                Colors.black,          // الجزء السفلي الملون
                Colors.black,          // اللون يتوقف عند progress
                Colors.transparent,   // الباقي شفاف
                Colors.transparent,
              ],
            ).createShader(rect);
          },
          blendMode: BlendMode.srcIn,
          child: Image.asset(
            'assets/image/account_setup/fingerprint.png',
            width: MediaQuery.of(context).size.width * 0.33,
          ),
        ),
      ],
    );
  }
}
