import 'package:spotify_clone_ui/entity/models/preview/preview_model.dart';

class ArtistPreview extends Preview {
  ArtistPreview(
    String? name,
    String? imageUrl,
  )   : _name = name,
        _imageUrl = imageUrl;

  final String? _name;
  final String? _imageUrl;

  @override
  String get previewText => _name ?? '';

  @override
  String? get previewUrl => _imageUrl;
}
