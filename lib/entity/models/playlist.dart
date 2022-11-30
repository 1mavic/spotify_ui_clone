import 'package:spotify_clone_ui/entity/models/artist.dart';
import 'package:spotify_clone_ui/entity/models/preview.dart';
import 'package:spotify_clone_ui/entity/models/preview_type.dart';
import 'package:spotify_clone_ui/entity/models/song.dart';

/// playlist entity
class Playlist implements Preview {
  /// playlist entity
  const Playlist({
    required this.playlistId,
    required this.name,
    required this.artists,
    required this.songs,
    required this.playlistCover,
  });

  /// playlist id
  final int playlistId;

  /// playlist name
  final String name;

  /// list of artists in playlist
  final List<Artist> artists;

  /// list of playlists songs
  final List<Song> songs;

  /// url of playlists cover
  final String? playlistCover;

  @override
  String? get image => playlistCover;

  @override
  String get previewText {
    if (artists.length == 1) {
      return artists.first.name;
    } else {
      final textPreview = StringBuffer();
      for (final artist in artists) {
        textPreview.write('${artist.name}, ');
      }
      return textPreview.toString();
    }
  }

  @override
  PreviewType get type => PreviewType.square;
}
