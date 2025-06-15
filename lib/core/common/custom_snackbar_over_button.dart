import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

void showCustomSnackbarOverButton({
  required BuildContext context,
  required GlobalKey buttonKey,
  required String message,
  required Color backgroundColor,
}) {
  final renderBox = buttonKey.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox == null) return;

  final size = renderBox.size;
  final offset = renderBox.localToGlobal(Offset.zero);

  final overlay = Overlay.of(context);
  final entry = OverlayEntry(
    builder:
        (_) => Positioned(
          left: offset.dx,
          top: offset.dy,
          width: size.width,
          height: size.height,
          child: Material(
            elevation: 8,
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message,
                style: AppTextStyles.bold14.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 2), () => entry.remove());
}
