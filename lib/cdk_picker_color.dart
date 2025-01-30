import 'package:flutter/cupertino.dart';
import 'cdk.dart';

// Copyright © 2023 Albert Palacios. All Rights Reserved.
// Licensed under the BSD 3-clause license, see LICENSE file for details.

class CDKPickerColor extends StatefulWidget {
  final Color color;
  final Function(Color)? onChanged;

  const CDKPickerColor({
    super.key,
    required this.color,
    this.onChanged,
  });

  @override
  CDKPickerColorState createState() => CDKPickerColorState();
}

class CDKPickerColorState extends State<CDKPickerColor> {
  double _rgbRed = 0;
  double _rgbGreen = 0;
  double _rgbBlue = 0;
  double _rgbAlpha = 0;

  _callbackRGB() {
    Color result = Color.fromARGB(
      (_rgbAlpha * 255).toInt(),
      _rgbRed.toInt(),
      _rgbGreen.toInt(),
      _rgbBlue.toInt(),
    );
    widget.onChanged!.call(result);
  }

  @override
  Widget build(BuildContext context) {
    _rgbRed = widget.color.red.toDouble();
    _rgbGreen = widget.color.green.toDouble();
    _rgbBlue = widget.color.blue.toDouble();
    _rgbAlpha = widget.color.alpha.toDouble() / 255;

    return SizedBox(
        width: 355,
        height: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              const Text("Basic Colors:"),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text("Custom colors:"),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: widget.color,
                      border: Border.all(
                        color: CDKTheme.grey100,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const CDKButton(
                style: CDKButtonStyle.normal,
                enabled: false,
                child: Text("Define custom color"),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  CDKButton(child: Text("OK")),
                  SizedBox(width: 8),
                  CDKButton(child: Text("Cancel")),
                ],
              ),
            ]),
            const SizedBox(width: 8),
            Column(children: [
              const SizedBox(height: 4),
              SizedBox(
                width: 180,
                height: 200,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: CDKPickerColorHSV(
                    value: widget.color,
                    onChanged: (value) {
                      widget.onChanged!.call(value);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("Hue: "),
                        SizedBox(
                          width: 30,
                          child: CDKFieldNumeric(
                            value: _rgbRed,
                            onValueChanged: (value) {
                              _rgbRed = value;
                              _callbackRGB();
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SizedBox(width: 7),
                        const Text("Sat: "),
                        SizedBox(
                          width: 30,
                          child: CDKFieldNumeric(
                            value: _rgbGreen,
                            onValueChanged: (value) {
                              _rgbGreen = value;
                              _callbackRGB();
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text("Lum: "),
                        SizedBox(
                          width: 30,
                          child: CDKFieldNumeric(
                            value: _rgbBlue,
                            onValueChanged: (value) {
                              _rgbBlue = value;
                              _callbackRGB();
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        const Text("Red: "),
                        SizedBox(
                          width: 30,
                          child: CDKFieldNumeric(
                            value: _rgbRed,
                            onValueChanged: (value) {
                              _rgbRed = value;
                              _callbackRGB();
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text("Green: "),
                        SizedBox(
                          width: 30,
                          child: CDKFieldNumeric(
                            value: _rgbGreen,
                            onValueChanged: (value) {
                              _rgbGreen = value;
                              _callbackRGB();
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SizedBox(width: 13),
                        const Text("Blue: "),
                        SizedBox(
                          width: 30,
                          child: CDKFieldNumeric(
                            value: _rgbBlue,
                            onValueChanged: (value) {
                              _rgbBlue = value;
                              _callbackRGB();
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 10),
              const CDKButton(child: Text("Add custom colors")),
            ])
          ],
        ));
  }
}
