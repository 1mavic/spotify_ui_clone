import 'package:spotify_clone_ui/entity/models/preview.dart';
import 'package:spotify_clone_ui/entity/models/preview_type.dart';
import 'package:spotify_clone_ui/entity/models/song.dart';

/// album entity
class Album implements Preview {
  /// album entity
  Album({
    required this.albumId,
    required this.name,
    required this.cover,
    this.albumInfo,
    required this.releaseDate,
    required this.songs,
  });

  /// album id
  final int albumId;

  /// album name
  final String name;

  /// url to album cover image
  final String? cover;

  /// text information about album
  final String? albumInfo;

  /// date of album release
  final DateTime releaseDate;

  /// list with album songs
  final List<Song> songs;

  /// get album total duration
  Duration get albumDuration {
    var total = Duration.zero;
    for (final song in songs) {
      total += song.duration;
    }
    return total;
  }

  @override
  String? get image => cover;

  @override
  String get previewText => name;

  @override
  PreviewType get type => PreviewType.square;
}
