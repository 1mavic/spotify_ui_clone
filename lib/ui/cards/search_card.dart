import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';

/// search card widget
class SearchCardWidget extends StatelessWidget {
  /// search card widget
  const SearchCardWidget({
    super.key,
    required this.cardColor,
    this.photo,
    required this.name,
  });

  /// background card color
  final Color cardColor;

  /// photo in card
  final String? photo;

  /// name of card
  final String name;
  @override
  Widget build(BuildContext context) {
    final url = photo;
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        7,
      ),
      child: ColoredBox(
        color: cardColor,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              right: 50,
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (url != null)
              Positioned(
                top: 20,
                right: -10,
                bottom: -5,
                child: Transform.rotate(
                  angle: -pi / 3,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: _SearchCardImageWidget(
                      url: url,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchCardImageWidget extends StatelessWidget {
  const _SearchCardImageWidget({
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          10,
        ),
        child: AppImageWidget(
          imageUrl: url,
        ),
      ),
    );
  }
}
