import 'package:flutter/cupertino.dart';
import 'cdk_globals.dart';
import 'cdk_theme_notifier.dart';
import 'cdk_theme.dart';

// Copyright © 2023 Albert Palacios. All Rights Reserved.
// Licensed under the BSD 3-clause license, see LICENSE file for details.

class CDKPickerButtonsSegmented extends StatefulWidget {
  final List<Widget> options;
  final int selectedIndex;
  final Function(int)? onSelected;
  final bool isAccent;

  const CDKPickerButtonsSegmented({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
    this.isAccent = false,
  });

  @override
  CDKPickerButtonsSegmentedState createState() =>
      CDKPickerButtonsSegmentedState();
}

class CDKPickerButtonsSegmentedState extends State<CDKPickerButtonsSegmented> {
  final int _animationMillis = 200;
  final List<GlobalKey> _keys = []; // Global keys for each option.
  final List<Rect> _rects = []; // Rectangles for the position of each option.
  double _width = 0.0; // Width of the entire widget.

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex < 0 ||
        widget.selectedIndex >= widget.options.length) {
      throw Exception(
          "CDKPickerButtonsSegmentedState initState: selectedIndex must be between 0 and options.length");
    }
    _keys.addAll(List.generate(widget.options.length, (index) => GlobalKey()));
  }

  /// Calculates the positions of each option for the animation.
  void _calculatePositions() {
    _rects.clear();
    RenderBox? rowBox = context.findRenderObject() as RenderBox?;

    if (rowBox != null) {
      _width = rowBox.size.width;
      for (var key in _keys) {
        final RenderBox box =
            key.currentContext?.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero, ancestor: rowBox);
        final size = box.size;
        _rects.add(
            Rect.fromLTWH(position.dx, position.dy, size.width, size.height));
      }
    }

    setState(() {});
  }

  /// Calculates the left position for the animation.
  double _getPositionLeft(int index) {
    if (index == 0) {
      return 2;
    } else {
      int previous = index - 1;
      double previousEnd = _rects[previous].left + _rects[previous].width;
      return (_rects[index].left - previousEnd) / 2 + previousEnd;
    }
  }

  /// Calculates the width for the animated selector.
  double _getPositionWidth(int index) {
    if (index == (_rects.length - 1)) {
      double tmp = 3;
      if (widget.isAccent) tmp = 2;
      return _width - _getPositionLeft(index) - tmp;
    } else {
      double positionLeft = _getPositionLeft(index);
      double nextLeft = _getPositionLeft(index + 1);
      return nextLeft - positionLeft;
    }
  }

  /// Adjusts the widget style based on the state and theme.
  Widget fixWidgetStyle(Widget widget, Color color) {
    if (widget is Text) {
      double size = 15.0;
      return Text(
        widget.data!,
        style: widget.style?.copyWith(color: color, fontSize: size) ??
            TextStyle(color: color, fontSize: size, fontFamily: 'Win95'),
      );
    }
    if (widget is Icon) {
      return Icon(
        widget.icon,
        color: color,
        size: 14.0,
      );
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    // Schedule a post-frame callback to calculate positions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _calculatePositions();
      }
    });

    return Container(
      height: 24,
      decoration: widget.isAccent
          ? const BoxDecoration()
          : BoxDecoration(
              color: theme.backgroundSecondary1,
              borderRadius: BorderRadius.circular(0.0),
              border: Border.all(
                color: CDKTheme.grey300,
                width: 0.5,
              ),
            ),
      child: Stack(
        children: [
          if (_rects.isNotEmpty)
            Positioned(
              left: _getPositionLeft(widget.selectedIndex),
              top: 2,
              width: _getPositionWidth(widget.selectedIndex),
              height: _rects[widget.selectedIndex].height - 3,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.isAccent
                      ? theme.isAppFocused
                          ? CDKTheme.grey100
                          : CDKTheme.white
                      : theme.isAppFocused
                          ? theme.backgroundSecondary0
                          : CDKTheme.white,
                  borderRadius: BorderRadius.circular(0.0),
                  border: widget.isAccent
                      ? const Border(
                          top: BorderSide(color: CDKTheme.black, width: 1),
                          left: BorderSide(color: CDKTheme.black, width: 1),
                          bottom: BorderSide(color: CDKTheme.white, width: 1),
                          right: BorderSide(color: CDKTheme.white, width: 1),
                        )
                      : null,
                  boxShadow: widget.isAccent
                      ? []
                      : [
                          const BoxShadow(
                            color: CDKGlobals.black,
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          )
                        ],
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(widget.options.length, (index) {
              return GestureDetector(
                  key: _keys[index],
                  onTap: () => widget.onSelected?.call(index),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 200),
                        tween: ColorTween(
                          begin: theme.colorText,
                          end: widget.isAccent &&
                                  index == widget.selectedIndex &&
                                  theme.isAppFocused
                              ? CDKTheme.black
                              : theme.colorText,
                        ),
                        builder: (BuildContext context, Color? color,
                            Widget? child) {
                          return fixWidgetStyle(widget.options[index], color!);
                        }),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
