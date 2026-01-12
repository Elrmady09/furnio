import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message,bool isSuccess) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.fixed,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSuccess? Colors.green.shade600 : Colors.red.shade600,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(isSuccess? Icons.check_circle_outline : Icons.error_outline , color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      duration: Duration(milliseconds: isSuccess? 800 : 1500),
    ),
  );
}
