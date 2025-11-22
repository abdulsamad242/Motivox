import 'package:flutter/material.dart';
import 'dart:math' as math;

class GiverProgressPainter extends CustomPainter {
  final int progress;
  final Color activeColor = const Color(0xFFE65100);
  final Color inactiveColor = const Color(0xFF616161);

  final List<Map<String, String>> segmentData = const [
    {'letter': 'G', 'label': 'GRATITUDE'},
    {'letter': 'I', 'label': 'IMAGINATION'},
    {'letter': 'V', 'label': 'VISUALIZATION'},
    {'letter': 'E', 'label': 'EXERCISE'},
    {'letter': 'R', 'label': 'READING'},
  ];

  GiverProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * 0.55;
    final rect = Rect.fromCircle(center: center, radius: radius);
    const strokeWidth = 22.0;
    const totalSegments = 5;
    const totalAngle = 2 * math.pi;
    const segmentSweep = totalAngle / totalSegments;
    const segmentGap = 0.04 * math.pi;
    const effectiveSweep = segmentSweep - segmentGap;

    var currentStartAngle = -math.pi / 2 - segmentSweep / 2;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final innerRingRadius = radius - strokeWidth / 2;

    for (int i = 0; i < totalSegments; i++) {
      final isCompleted = i < progress;
      final color = isCompleted ? activeColor : inactiveColor;

      final segmentPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;

      canvas.drawArc(
        rect,
        currentStartAngle,
        effectiveSweep,
        false,
        segmentPaint,
      );

      final midAngle = currentStartAngle + effectiveSweep / 2;
      final letterRadius = radius + strokeWidth / 2 + 12;
      final letterCenter = Offset(
        center.dx + letterRadius * math.cos(midAngle),
        center.dy + letterRadius * math.sin(midAngle),
      );

      final rotationAngle = midAngle + math.pi / 2;

      final letter = segmentData[i]['letter']!;
      final fullLabel = segmentData[i]['label']!;

      final letterStyle = TextStyle(
        color: isCompleted ? activeColor : inactiveColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

      textPainter.text = TextSpan(text: letter, style: letterStyle);
      textPainter.layout();
      canvas.save();
      canvas.translate(letterCenter.dx, letterCenter.dy);
      canvas.rotate(rotationAngle);
      textPainter.paint(canvas, Offset(-textPainter.width / 2, -18));
      canvas.restore();

      final wordStyle = TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      );

      textPainter.text = TextSpan(text: fullLabel, style: wordStyle);
      textPainter.layout();
      canvas.save();
      canvas.translate(letterCenter.dx, letterCenter.dy);
      canvas.rotate(rotationAngle);
      textPainter.paint(canvas, Offset(-textPainter.width / 2, 0));
      canvas.restore();

      currentStartAngle += segmentSweep;
    }

    final centerTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    );
    final centerSubTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    );

    textPainter.text = TextSpan(
      children: [
        TextSpan(text: '$progress/5\n', style: centerTextStyle),
        TextSpan(text: 'Done', style: centerSubTextStyle),
      ],
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant GiverProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
