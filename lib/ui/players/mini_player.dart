import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/song.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';

/// mini player widget, with info about currently plaing song
class MiniPlayerWidget extends StatelessWidget {
  /// mini player widget, with info about currently plaing song
  const MiniPlayerWidget({
    super.key,
    required this.song,
    required this.color,
  });

  /// current song
  final Song song;

  /// mini player color
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            5,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const AppImageWidget(
                      imageUrl: 'assets/images/artists/husky.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'song name',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'artist name',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.speaker_group_outlined,
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.play_arrow_rounded,
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
