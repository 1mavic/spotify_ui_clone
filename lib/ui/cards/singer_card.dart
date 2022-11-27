import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';

/// Artis preview widget. Circle artist avatar with name.
/// Size defines widget width and singer avatar width and height.
/// On tap should open artist screen.
class SingerCardWidget extends StatelessWidget {
  /// Artis preview widget. Circle artist avatar with name.
  /// On tap should open artist screen.
  const SingerCardWidget({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.name,
    required this.onTap,
  });

  /// link to artist preview image
  final String? imageUrl;

  /// artins name
  final String? name;

  /// onTap callBack
  final VoidCallback onTap;

  /// Size defines widget width and singer avatar width and height.
  final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: size,
        child: Column(
          children: [
            SizedBox(
              width: size,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
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
              name ?? '',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
