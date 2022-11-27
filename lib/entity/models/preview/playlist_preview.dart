import 'package:spotify_clone_ui/entity/models/preview/preview_model.dart';

class PlaylistPreview extends Preview {
  PlaylistPreview(
    List<String>? names,
    String? imageUrl,
  )   : _names = names ?? [],
        _imageUrl = imageUrl;

  final List<String> _names;
  final String? _imageUrl;

  @override
  String get previewText => _names.join(', ');

  @override
  String? get previewUrl => _imageUrl;
}
