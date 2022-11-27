/// song class
class Song {
  /// song class
  Song({
    required this.songId,
    required this.name,
    required this.duration,
    this.lyrics,
  });

  /// song id
  final int songId;

  /// song name
  final String name;

  /// song duration
  final Duration duration;

  /// song lyrics
  final String? lyrics;
}
