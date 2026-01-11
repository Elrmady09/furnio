import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../widgets/dialog/no_internet_dialog.dart';

class InternetListener extends StatefulWidget {
  final Widget child;
  const InternetListener({super.key, required this.child});

  @override
  State<InternetListener> createState() => _InternetListenerState();
}

class _InternetListenerState extends State<InternetListener> {
  late StreamSubscription subscription;
  bool dialogShown = false;

  @override
  void initState() {
    super.initState();
    monitorConnection();
  }

  void monitorConnection() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      bool hasInternet = await checkInternet();

      if (!hasInternet && !dialogShown) {
        dialogShown = true;
        showNoInternetDialog();
      } else if (hasInternet && dialogShown) {
        Navigator.of(context, rootNavigator: true).pop();
        dialogShown = false;
      }
    });
  }

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => NoInternetDialog(),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}