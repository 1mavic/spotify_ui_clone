import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// function to call player modal botton sheet
Future<T?> showPlayerSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isDismissable = true,
  bool rootNav = true,
}) =>
    showMaterialModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      barrierColor: Colors.transparent,
      builder: builder,
    );
