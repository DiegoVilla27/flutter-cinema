import 'package:flutter/material.dart';
import 'package:flutter_cinema/shared/widgets/wave_bottom_navigation/widgets/waves_config/waves_config.dart';

/// Custom painter for drawing a wave-shaped bottom bar with optional elevation and corner radius.
///
/// This painter creates a dynamic wave in the center of the bar based on the current selected index.
/// It supports directional wave (up/down), corner rounding, and shadow elevation.
class WavePainter extends CustomPainter {
  /// Height of the wave crest/trough.
  final double amplitude;

  /// Length of the wave segment.
  final double waveLength;

  /// Fill color of the wave bar.
  final Color backgroundColor;

  /// Shadow blur radius.
  final double elevation;

  /// Shadow color used when elevation is applied.
  final Color shadowColor;

  /// Direction of the wave (up or down).
  final WaveBottomBarDirection direction;

  /// Border radius for all four corners.
  final BorderRadius corner;

  /// Total number of items in the bottom bar.
  final int barCount;

  /// Percentage of width indicating the current selected item.
  final double percentage;

  WavePainter({
    required this.amplitude,
    required this.waveLength,
    required this.backgroundColor,
    required this.elevation,
    required this.shadowColor,
    required this.direction,
    required this.corner,
    required this.barCount,
    required this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint pathPaint = Paint()..color = backgroundColor;
    final Paint shadowPaint =
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.outer, elevation);
    final perWidth = size.width / barCount;
    final begin = size.width * percentage;
    final middle = begin + perWidth / 2;

    final Path path =
        Path()
          ..moveTo(0, corner.topLeft.y)
          ..arcToPoint(Offset(corner.topLeft.x, 0), radius: corner.topLeft)
          ..lineTo(middle - waveLength / 2, 0)
          ..cubicTo(
            middle - waveLength / 4,
            0,
            middle - waveLength / 4,
            direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
            middle,
            direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
          )
          ..cubicTo(
            middle + waveLength / 4,
            direction == WaveBottomBarDirection.up ? -amplitude : amplitude,
            middle + waveLength / 4,
            0,
            middle + waveLength / 2,
            0,
          )
          ..lineTo(size.width - corner.topRight.x, 0)
          ..arcToPoint(
            Offset(size.width, corner.topRight.y),
            radius: corner.topRight,
          )
          ..lineTo(size.width, size.height - corner.bottomRight.y)
          ..arcToPoint(
            Offset(size.width - corner.bottomRight.x, size.height),
            radius: corner.bottomRight,
          )
          ..lineTo(corner.bottomLeft.x, size.height)
          ..arcToPoint(
            Offset(0, size.height - corner.bottomLeft.y),
            radius: corner.bottomLeft,
          )
          ..close();

    if (elevation > 0) {
      canvas.drawPath(path, shadowPaint);
    }
    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
