import 'package:flutter/material.dart';

class AnimatedUploadWidget extends StatelessWidget {
  final double progress;

  const AnimatedUploadWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.blue,
            value: progress,
            strokeWidth: 8.0,
          ),
          Text('${(progress * 100).round()}%'),
        ],
      ),
    );
  }
}
