import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/entity/models/album.dart';
import 'package:spotify_clone_ui/entity/models/song.dart';
import 'package:spotify_clone_ui/ui/image_widget/app_image.dart';
import 'package:spotify_clone_ui/ui/modal_sheets.dart/modal_bottom.dart';
import 'package:spotify_clone_ui/ui/players/full_screen_player/player_widget.dart';

part './progress_bar_widget.dart';
part './name_song_widget.dart';

/// mini player widget, with info about currently plaing song
class MiniPlayerWidget extends StatefulWidget {
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
  State<MiniPlayerWidget> createState() => _MiniPlayerWidgetState();
}

class _MiniPlayerWidgetState extends State<MiniPlayerWidget> {
  bool _isPlaing = false;
  @override
  Widget build(BuildContext context) {
    final songList = List.generate(
      5,
      (index) => Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: _NameSongArtistWidget(
          songName: widget.song.name,
          artistName: 'Husky',
        ),
      ),
    );
    return GestureDetector(
      onTap: () {
        showPlayerSheet<void>(
          context: context,
          builder: (context) => PLayerWidget(
            color: Colors.deepPurple.shade700,
            album: album,
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(
              7,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
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
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: PageView(
                            children: songList,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.speaker_group_outlined,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isPlaing = !_isPlaing;
                          });
                        },
                        child: Icon(
                          _isPlaing ? Icons.pause : Icons.play_arrow_rounded,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                _MiniProgressBarWidget(
                  songDuration: widget.song.duration,
                  onSongEnd: () {},
                  isPlaing: _isPlaing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// test album
final album = Album(
  albumId: 4,
  name: 'Test album',
  cover: 'assets/images/artists/icepeak.png',
  releaseDate: DateTime(2021, 04, 12),
  songs: [
    Song(
      songId: 41,
      name: 'Song name',
      duration: const Duration(
        seconds: 13,
      ),
    ),
    Song(
      songId: 41,
      name: 'Song name',
      duration: const Duration(
        seconds: 40,
      ),
    ),
    Song(
      songId: 41,
      name: 'Song name',
      duration: const Duration(
        minutes: 2,
        seconds: 13,
      ),
    ),
    Song(
      songId: 41,
      name: 'Song name',
      duration: const Duration(
        minutes: 2,
        seconds: 13,
      ),
    ),
  ],
);
