import 'package:spotify_clone_ui/entity/models/preview_type.dart';

/// interface to previews
abstract class Preview {
  /// get text under preview image
  String get previewText;

  /// get url to preview image
  String? get image;

  /// get image preview type
  PreviewType get type;
}
