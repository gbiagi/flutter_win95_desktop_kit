import 'package:flutter/widgets.dart';
import 'cdk_globals.dart';

class CDKButtonHelp extends StatefulWidget {
  final double size;
  final VoidCallback? onPressed;

  const CDKButtonHelp({
    super.key,
    this.onPressed,
    this.size = 24.0,
  });

  @override
  CDKButtonHelpState createState() => CDKButtonHelpState();
}

class CDKButtonHelpState extends State<CDKButtonHelp> {
  /// Whether the button is currently pressed.
  bool _isPressed = false;

  /// Handles the `onTapDown` event, updating the `_isPressed` state variable.
  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  /// Handles the `onTapUp` event, updating the `_isPressed` state variable and calling the `onPressed` callback function.
  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  /// Handles the `onTapCancel` event, updating the `_isPressed` state variable.
  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    // Apply styles consistent with the CDKButton and CDKButtonCheckBox.
    BoxDecoration decoration = _isPressed
        ? CDKGlobals.pressedDecorationOutside
        : CDKGlobals.elevatedDecorationOutside;

    BoxDecoration innerDecoration = _isPressed
        ? CDKGlobals.pressedDecoration
        : CDKGlobals.elevatedDecoration;

    TextStyle textStyle = CDKGlobals.textStyle.copyWith(
      fontSize: widget.size / 1.5,
      color: CDKGlobals.black,
      fontWeight: FontWeight.w300,
    );

    return GestureDetector(
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
            child: Text(
              '?',
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
