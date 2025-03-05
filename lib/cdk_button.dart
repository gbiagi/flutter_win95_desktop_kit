import 'package:flutter/widgets.dart';
import 'cdk_globals.dart';

// Custom font import
import 'package:flutter/material.dart';

enum CDKButtonStyle { action, normal, destructive }

class CDKButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final CDKButtonStyle style;
  final bool isLarge;
  final bool enabled;

  const CDKButton({
    super.key,
    this.onPressed,
    required this.child,
    this.style = CDKButtonStyle.normal,
    this.isLarge = false,
    this.enabled = true,
  });

  @override
  CDKButtonState createState() => CDKButtonState();
}

class CDKButtonState extends State<CDKButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // Define styles based on the button's state and style.
    BoxDecoration decoration = _isPressed
        ? CDKGlobals.pressedDecorationOutside
        : CDKGlobals.elevatedDecorationOutside;

    BoxDecoration innerDecoration = _isPressed
        ? CDKGlobals.pressedDecoration
        : CDKGlobals.elevatedDecoration;

    TextStyle textStyle =
        (widget.enabled ? CDKGlobals.textStyle : CDKGlobals.disabledTextStyle)
            .copyWith(
      fontFamily: 'Win95',
    );

    EdgeInsets padding = _isPressed
        ? const EdgeInsets.only(top: 1.0, left: 1.0)
        : const EdgeInsets.all(0.0);

    return GestureDetector(
      onTapDown: widget.enabled
          ? (details) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.enabled
          ? (details) => setState(() => _isPressed = false)
          : null,
      onTapCancel:
          widget.enabled ? () => setState(() => _isPressed = false) : null,
      onTap: widget.enabled ? widget.onPressed : null,
      child: IntrinsicWidth(
        child: SizedBox(
          height: widget.isLarge ? 40 : 30,
          child: DecoratedBox(
            decoration: decoration,
            child: Container(
              padding: widget.isLarge
                  ? const EdgeInsets.fromLTRB(12, 8, 12, 8)
                  : const EdgeInsets.fromLTRB(8, 4, 8, 4),
              decoration: innerDecoration,
              child: DefaultTextStyle(
                style: textStyle,
                child: Padding(
                  padding: padding,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
