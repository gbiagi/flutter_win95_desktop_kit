import 'package:flutter/cupertino.dart';
import 'cdk_widgets.dart';

// Copyright © 2023 Albert Palacios. All Rights Reserved.
// Licensed under the BSD 3-clause license, see LICENSE file for details.

class CDKButtonColor extends StatefulWidget {
  final VoidCallback? onPressed;
  final Color color;
  final bool enabled;

  const CDKButtonColor({
    Key? key,
    this.onPressed,
    required this.color,
    this.enabled = true,
  }) : super(key: key);

  @override
  CDKButtonColorState createState() => CDKButtonColorState();
}

class CDKButtonColorState extends State<CDKButtonColor> {
  // Flag to track if the button is currently pressed.
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;
    Color color = theme.isLight
        ? _isPressed
            ? CDKTheme.grey90
            : CDKTheme.grey50
        : _isPressed
            ? CDKTheme.grey800
            : CDKTheme.grey600;

    // Define styles and themes based on the button's state and style.
    BoxDecoration decoration;

    BoxShadow shadow = BoxShadow(
      color: CDKTheme.black.withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 1,
      offset: const Offset(0, 1),
    );

    // Styling logic depending on the button's style and state.
    decoration = BoxDecoration(
        color: theme.backgroundSecondary0,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [shadow]);

    return GestureDetector(
        onTapDown: !widget.enabled
            ? null
            : (details) => setState(() => _isPressed = true),
        onTapUp: !widget.enabled
            ? null
            : (details) => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: MouseRegion(
          onEnter: (event) => setState(() => _isHovered = true),
          onExit: (event) => setState(() => _isHovered = false),
          child: SizedBox(
            width: 65,
            height: 22,
            child: Stack(
              children: [
                DecoratedBox(
                  decoration: decoration,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: CustomPaint(
                      painter: CDKUtilShaderGrid(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(color: widget.color),
                          ),
                          Container(
                            width: 20,
                            color: Color(widget.color.value | 0xFF000000),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: color, width: 1),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                if (_isHovered)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 20,
                        child: IconTheme(
                          data: const IconThemeData(size: 14),
                          child:
                              Icon(CupertinoIcons.chevron_down, color: color),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
