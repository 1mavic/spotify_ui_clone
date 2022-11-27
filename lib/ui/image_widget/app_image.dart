import 'package:flutter/material.dart';

/// Custom application image Widget
class AppImageWidget extends StatelessWidget {
  /// Custom application image Widget
  const AppImageWidget({
    super.key,
    required this.imageUrl,
    this.fit,
  });

  /// images url
  final String? imageUrl;

  /// boxFit parameter of image
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null) {
      return const SizedBox.expand(
        child: ColoredBox(
          color: Colors.black,
        ),
      );
    }
    return Image.asset(
      url,
      fit: fit,
    );
  }
}
