import 'package:flutter/material.dart';
import 'package:teste_firebase_web/core/common/extensions/context_extension.dart';

Future<T?> showCustomDialog<T>(
  BuildContext context, {
  required Widget child,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxHeight: context.heightPx * 0.95,
      minHeight: context.heightPx * 0.4,
    ),
    isDismissible: false,
    isScrollControlled: true,
    enableDrag: false,
    elevation: 0,
    builder: (context) => child,
  );
}
