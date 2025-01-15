import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'cdk_globals.dart';

class CDKButtonCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final bool enabled;

  const CDKButtonCheckBox({
    Key? key,
    required this.value,
    this.onChanged,
    this.label,
    this.enabled = true,
  }) : super(key: key);

  @override
  _CDKButtonCheckBoxState createState() => _CDKButtonCheckBoxState();
}

class _CDKButtonCheckBoxState extends State<CDKButtonCheckBox> {
  bool _isPressed = false;
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    // Define styles based on the checkbox's state and value.
    BoxDecoration decoration = _isPressed
        ? CDKGlobals.pressedDecorationOutside
        : CDKGlobals.elevatedDecorationOutside;

    BoxDecoration innerDecoration = BoxDecoration(
      color: CDKGlobals.white, // Set the background to white
      border: Border(
        top: BorderSide(
            color: _isPressed ? CDKGlobals.grays[2] : CDKGlobals.grays[0]),
        left: BorderSide(
            color: _isPressed ? CDKGlobals.grays[2] : CDKGlobals.grays[0]),
        bottom: BorderSide(
            color: _isPressed ? CDKGlobals.grays[0] : CDKGlobals.grays[2]),
        right: BorderSide(
            color: _isPressed ? CDKGlobals.grays[0] : CDKGlobals.grays[2]),
      ),
    );

    TextStyle textStyle =
        (widget.enabled ? CDKGlobals.textStyle : CDKGlobals.disabledTextStyle);

    Widget checkmark = _currentValue
        ? Icon(Icons.check,
            size: 16,
            color: widget.enabled ? CDKGlobals.black : CDKGlobals.grays[3])
        : const SizedBox.shrink();

    EdgeInsets padding = _isPressed
        ? const EdgeInsets.only(top: 1.0, left: 1.0)
        : const EdgeInsets.all(0.0);

    Widget checkbox = GestureDetector(
      onTapDown: widget.enabled
          ? (details) => setState(() => _isPressed = true)
          : null,
      onTapUp: widget.enabled
          ? (details) {
              setState(() {
                _isPressed = false;
                _currentValue = !_currentValue;
              });
              widget.onChanged?.call(_currentValue);
            }
          : null,
      onTapCancel:
          widget.enabled ? () => setState(() => _isPressed = false) : null,
      child: SizedBox(
        width: 24,
        height: 24,
        child: DecoratedBox(
          decoration: decoration,
          child: Container(
            decoration: innerDecoration,
            alignment: Alignment.center,
            child: checkmark,
          ),
        ),
      ),
    );

    if (widget.label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          checkbox,
          const SizedBox(width: 8),
          Text(widget.label!, style: textStyle),
        ],
      );
    }

    return checkbox;
  }
}
