import 'package:flutter/cupertino.dart';
import 'cdk_theme.dart';
import 'cdk_theme_notifier.dart';

// Copyright © 2023 Albert Palacios. All Rights Reserved.
// Licensed under the BSD 3-clause license, see LICENSE file for details.

class CDKButtonDisclosure extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final double size;

  const CDKButtonDisclosure({
    super.key,
    required this.value,
    this.onChanged,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    // Determine the rotation angle based on the value.
    final double rotationAngle =
        value ? 3.14159 / 2 : 0.0; // 90° for `true`, 0° for `false`

    return GestureDetector(
      onTap: () => onChanged?.call(!value),
      child: Transform.rotate(
        angle: rotationAngle, // Rotate 90 degrees when `value` is true
        child: Icon(
          CupertinoIcons.chevron_forward,
          color: theme.colorText,
          size: size,
        ),
      ),
    );
  }
}
