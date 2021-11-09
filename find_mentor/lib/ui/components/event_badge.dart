// Flutter imports:
import 'package:flutter/material.dart';

class EventBadge extends CustomPainter {
  final Color color;

  EventBadge({ this.color });

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = new Path()
      ..moveTo(-25, 0)
      ..relativeLineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..relativeLineTo(30, -size.height)
      ..close();
    final Paint paint = new Paint()
      ..color = color ?? Colors.white;

    canvas.drawPath(
      path,
      paint
    );
  }

  @override
  bool shouldRepaint(EventBadge oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(EventBadge oldDelegate) => false;
}
