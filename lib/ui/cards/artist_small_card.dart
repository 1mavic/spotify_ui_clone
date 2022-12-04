import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/artist.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';

/// widget with artist preview. small image and column
class SmallArtistCardWidget extends StatelessWidget {
  /// widget with artist preview. small image and column
  const SmallArtistCardWidget({
    super.key,
    required this.artist,
  });

  /// artist for preview
  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipOval(
              child: AppImageWidget(
                imageUrl: artist.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artist.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'исполнитель',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade500,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
