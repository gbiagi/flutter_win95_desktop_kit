import 'package:flutter/material.dart';
import 'cdk_globals.dart';

class CDKButtonIcon extends StatefulWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double size;
  final bool isCircle;
  final bool isSelected;

  const CDKButtonIcon({
    super.key,
    this.onPressed,
    this.icon = Icons.help,
    this.size = 24.0,
    this.isCircle = false,
    this.isSelected = false,
  });

  @override
  CDKButtonIconState createState() => CDKButtonIconState();
}

class CDKButtonIconState extends State<CDKButtonIcon> {
  bool _isPressed = false;
  bool _isHovering = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  void _onMouseEnter(PointerEvent details) {
    setState(() => _isHovering = true);
  }

  void _onMouseExit(PointerEvent details) {
    setState(() => _isHovering = false);
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = _isPressed
        ? CDKGlobals.pressedDecorationOutside
        : CDKGlobals.elevatedDecorationOutside;

    BoxDecoration innerDecoration = _isPressed
        ? CDKGlobals.pressedDecoration
        : CDKGlobals.elevatedDecoration;

    Color iconColor = widget.isSelected ? CDKGlobals.primary : CDKGlobals.black;

    return MouseRegion(
      onEnter: _onMouseEnter,
      onExit: _onMouseExit,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onPressed,
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: DecoratedBox(
            decoration: decoration,
            child: Container(
              decoration: innerDecoration,
              alignment: Alignment.center,
              child: Icon(
                widget.icon,
                color: iconColor,
                size: widget.size * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
