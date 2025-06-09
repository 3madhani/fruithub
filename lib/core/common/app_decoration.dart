import 'package:skeletonizer/skeletonizer.dart';

abstract class AppDecoration {
  static var greyBoxDecoration = ShapeDecoration(
    color: const Color(0x7FF2F3F3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
  );
}
