import 'package:flutter/widgets.dart';
import 'cdk_globals.dart';

class CDKButtonSwitch extends StatelessWidget {
  final bool value;
  final double size;
  final ValueChanged<bool>? onChanged;

  const CDKButtonSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.size = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    double backHeight = size; // Total height of the switch background
    double backWidth = size * 2.0; // Total width of the switch background
    double thumbSize =
        backHeight - 4.0; // Size of the thumb (2.0 padding on each side)
    double thumbPosition = value
        ? (backWidth - thumbSize - 2.0)
        : 2.0; // Horizontal position of the thumb

    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        height: backHeight,
        width: backWidth,
        decoration: BoxDecoration(
          color: value ? CDKGlobals.primary : CDKGlobals.grays[1],
          border: Border.all(color: CDKGlobals.grays[3]),
          boxShadow: const [
            BoxShadow(
              color: CDKGlobals.white,
              offset: Offset(-1, -1),
              blurRadius: 0,
            ),
            BoxShadow(
              color: CDKGlobals.black,
              offset: Offset(1, 1),
              blurRadius: 0,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center, // Ensures proper vertical centering
          children: [
            Positioned(
              left: thumbPosition, // Dynamic left position for on/off states
              child: Container(
                height: thumbSize,
                width: thumbSize,
                decoration: BoxDecoration(
                  color: CDKGlobals.white,
                  border: Border.all(color: CDKGlobals.grays[2]),
                  boxShadow: const [
                    BoxShadow(
                      color: CDKGlobals.white,
                      offset: Offset(-1, -1),
                      blurRadius: 0,
                    ),
                    BoxShadow(
                      color: CDKGlobals.black,
                      offset: Offset(1, 1),
                      blurRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
