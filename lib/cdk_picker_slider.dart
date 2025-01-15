import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';
import 'cdk_theme_notifier.dart';
import 'cdk_theme.dart';

// Copyright © 2023 Albert Palacios. All Rights Reserved.
// Licensed under the BSD 3-clause license, see LICENSE file for details.

class CDKPickerSlider extends StatefulWidget {
  final double value;
  final double size;
  final bool enabled;
  final Function(double)? onChanged;

  const CDKPickerSlider({
    super.key,
    required this.value,
    this.enabled = true,
    this.size = 16,
    required this.onChanged,
  });

  @override
  CDKPickerSliderState createState() => CDKPickerSliderState();
}

class CDKPickerSliderState extends State<CDKPickerSlider> {
  @override
  void initState() {
    super.initState();
    if (widget.value < 0 || widget.value > 1) {
      throw Exception(
          "CDKPickerSliderState initState: value must be between 0 and 1");
    }
  }

  void _getValue(Offset globalPosition) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.globalToLocal(globalPosition);

    final double radius = renderBox.size.height / 3;
    final circleRail = renderBox.size.width - radius * 2;

    double newValue = ((position.dx - radius) / circleRail).clamp(0.0, 1.0);

    if (newValue < 0) {
      newValue = 0;
    }
    if (newValue > 1) {
      newValue = 1;
    }

    widget.onChanged?.call(newValue);
  }

  void _onTapDown(TapDownDetails details) {
    _getValue(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _getValue(details.globalPosition);
  }

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    return GestureDetector(
      onTapDown: (details) {
        _onTapDown(details);
      },
      onPanUpdate: !widget.enabled ? null : _onPanUpdate,
      child: CustomPaint(
        painter: CDKPickerSliderPainter(
          colorAccent: theme.accent,
          colorBar: CDKGlobals.grays[2],
          colorCircle: theme.backgroundSecondary0,
          value: widget.value,
          hasAppFocus: theme.isAppFocused, // Border color
        ),
        size: Size(widget.size, widget.size),
      ),
    );
  }
}

class CDKPickerSliderPainter extends CustomPainter {
  final Color colorAccent;
  final Color colorBar;
  final Color colorCircle;
  final double value;
  final bool hasAppFocus;

  CDKPickerSliderPainter(
      {required this.colorAccent,
      required this.colorBar,
      required this.colorCircle,
      required this.value,
      this.hasAppFocus = true});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = colorBar
      ..style = PaintingStyle.fill;

    Paint progressPaint = Paint()
      ..color = hasAppFocus ? colorAccent : CDKTheme.white
      ..style = PaintingStyle.fill;

    // Calcula l'alçada i la posició vertical centrada de la barra
    const double barHeight = 20.0;
    const Radius barHeightHalf = Radius.circular(0.0);
    final double verticalOffset = (size.height - barHeight) / 2;

    // Crea rectangles amb els costats arrodonits
    RRect backgroundRRect = RRect.fromLTRBR(
      0,
      verticalOffset,
      size.width,
      verticalOffset + barHeight,
      barHeightHalf,
    );

    double progressWidth = size.width * value;

    RRect progressRRect = RRect.fromLTRBR(
      0,
      verticalOffset,
      progressWidth,
      verticalOffset + barHeight,
      barHeightHalf,
    );

    // Create border paint
    final borderPaint = Paint()
      ..color = CDKGlobals.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    // Dibuixa el fons i el progrés
    canvas.drawRRect(backgroundRRect, backgroundPaint);
    canvas.drawRRect(progressRRect, progressPaint);
    canvas.drawRRect(backgroundRRect, borderPaint); // Draw border last

    // Draw the vertical rectangle following the progress bar
    const double rectWidth = 10.0;
    final double rectHeight = size.height;
    final double rectX = progressWidth - (rectWidth / 2);
    const double rectY = 0.0;
    final rectPaint = Paint()
      ..color = colorCircle
      ..style = PaintingStyle.fill;
    final rect = Rect.fromLTWH(rectX, rectY, rectWidth, rectHeight);
    canvas.drawRect(rect, rectPaint);

    // Draw the border for the rectangle
    final rectBorderPaint = Paint()
      ..color = CDKGlobals.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.0;
    canvas.drawRect(rect, rectBorderPaint);

    // Draw the small vertical line inside the rectangle
    const double lineWidth = 2.0;
    final double lineHeight = rectHeight / 2;
    final double lineX = progressWidth - (lineWidth / 2);
    final double lineY = (rectHeight - lineHeight) / 2;
    final linePaint = Paint()
      ..color = CDKTheme.black
      ..style = PaintingStyle.fill;
    final line = Rect.fromLTWH(lineX, lineY, lineWidth, lineHeight);
    canvas.drawRect(line, linePaint);
  }

  @override
  bool shouldRepaint(covariant CDKPickerSliderPainter oldDelegate) {
    return oldDelegate.colorAccent != colorAccent ||
        oldDelegate.colorBar != colorBar ||
        oldDelegate.colorCircle != colorCircle ||
        oldDelegate.value != value ||
        oldDelegate.hasAppFocus != hasAppFocus;
  }
}
