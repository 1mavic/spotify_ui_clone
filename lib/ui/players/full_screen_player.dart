import 'package:flutter/material.dart';

class FullScreenPlayer extends StatelessWidget {
  const FullScreenPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(color: Colors.green),
    );
  }
}
