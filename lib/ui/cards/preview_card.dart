import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/preview.dart';
import 'package:spotify_clone_ui/entity/models/preview_type.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';

///  Preview widget with image and preview text.
/// Size defines widget width and playlist preview width and height.
/// Type defines sape of preview image
class PrevieCardWidget extends StatelessWidget {
  ///  Preview widget with image and preview text.
  /// Size defines widget width and playlist preview width and height.
  /// Type defines sape of preview image
  const PrevieCardWidget({
    super.key,
    required this.size,
    required this.preview,
  });

  /// preview width
  final double size;

  /// preview entity to show
  final Preview preview;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: size,
        child: Column(
          children: [
            SizedBox(
              width: size,
              child: AspectRatio(
                aspectRatio: 1,
                child: preview.type == PreviewType.circle
                    ? ClipOval(
                        child: AppImageWidget(
                          imageUrl: preview.image,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        child: AppImageWidget(
                          imageUrl: preview.image,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              preview.previewText,
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
