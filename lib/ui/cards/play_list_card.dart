import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';

/// PlayList preview widget. Square playlist image with names.
/// Size defines widget width and playlist preview width and height.
/// On tap should open artist screen.
class PlayListCardWidget extends StatelessWidget {
  /// PlayList preview widget. Square playlist image with names.
  /// Size defines widget width and playlist preview width and height.
  /// On tap should open artist screen.
  const PlayListCardWidget({
    super.key,
    this.imageUrl,
    this.names = const [],
    required this.onTap,
    required this.size,
  });

  /// link to playlist preview image
  final String? imageUrl;

  /// artins name
  final List<String> names;

  /// onTap callBack
  final VoidCallback onTap;

  /// Size defines widget width and playlist preview width and height.
  final double size;
  @override
  Widget build(BuildContext context) {
    final text = names.join(', ');
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: size,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  child: AppImageWidget(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
