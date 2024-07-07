import 'package:flutter/material.dart';

class AnimatedUploadWidget extends StatelessWidget {
  final double progress;

  const AnimatedUploadWidget({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 8.0,
          ),
          Text('${(progress * 100).round()}%'),
        ],
      ),
    );
  }
}