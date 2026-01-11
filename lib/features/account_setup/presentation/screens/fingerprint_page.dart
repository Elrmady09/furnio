import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/fingerprint_provider.dart';
import '../widgets/account_header.dart';
import '../widgets/fingerprint_actions.dart';
import '../widgets/fingerprint_scan_Icon.dart';

class FingerprintPage extends StatelessWidget {
  const FingerprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FingerprintProvider>(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          child: Column(
            children: [
              /// Header
              const AccountHeader(title: 'Set Your Fingerprint'),
              HeightSpace1(space: 40),

              /// Text
              GeneralText(
                text: 'Add a fingerprint to make your account more secure.',
                sizeText: size.width * 0.038,
                textAlign: TextAlign.center,
              ),
              HeightSpace1(space: 100),

              /// Fingerprint image
              GestureDetector(
                onTap: provider.startScan,
                child: FingerprintScanIcon(progress: provider.scanProgress),
              ),
              HeightSpace1(space: 40),

              /// Scanning Progress
              GeneralText(
                text: "Scanning (${provider.scanProgress.toInt()}%)",
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w500,
                color:
                    provider.scanProgress == 100 ? Colors.black : Colors.grey,
              ),
              Spacer(),

              /// Text
              GeneralText(
                text:
                    'please put your finger on the fingerprint\nscanner to get started',
                sizeText: size.width * 0.038,
                textAlign: TextAlign.center,
              ),
              HeightSpace1(space: 50),

              /// Buttons
              const FingerprintActions(),
            ],
          ),
        ),
      ),
    );
  }
}
