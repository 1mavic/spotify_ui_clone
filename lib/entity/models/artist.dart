import 'package:spotify_clone_ui/entity/models/album.dart';
import 'package:spotify_clone_ui/entity/models/preview.dart';
import 'package:spotify_clone_ui/entity/models/preview_type.dart';

/// artist entity
class Artist implements Preview {
  /// artist entity
  Artist({
    required this.artistId,
    required this.name,
    this.bio,
    this.albums = const [],
    this.photoUrl,
  });

  /// artist id
  final int artistId;

  /// artist name
  final String name;

  /// artist biography
  final String? bio;

  /// artist albums
  final List<Album> albums;

  /// url to artist photo
  final String? photoUrl;

  @override
  String? get image => photoUrl;

  @override
  String get previewText => name;

  @override
  PreviewType get type => PreviewType.circle;
}
