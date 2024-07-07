import 'package:flutter/material.dart';

class ProgresIndicatior {
  static void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
