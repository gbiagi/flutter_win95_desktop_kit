import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutPickers extends StatefulWidget {
  const LayoutPickers({super.key});

  @override
  State<LayoutPickers> createState() => _LayoutPickersState();
}

class _LayoutPickersState extends State<LayoutPickers> {
  final double _angle = 0.0;
  double _valueSlider = 0.5;
  int _selectedIndexButtonsSegmented0 = 1;
  int _selectedIndexButtonsSegmented1 = 1;
  List<bool> _selectedStatesButtonsBar0 = [true, false, false, false];
  List<bool> _selectedStatesButtonsBar1 = [true, false, true, false];

  late List<Color> _valueSliderColors;
  final List<double> _valueSliderStops = const [0.0, 1.0];
  double _valueSliderGradient = 0.75;

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    _valueSliderColors = [CDKTheme.black, theme.accent];
    Color valueSliderGradientColor = CDKPickerSliderGradient.getColorAtValue(
        _valueSliderColors, _valueSliderStops, _valueSliderGradient);

    return ListView(children: [
      const SizedBox(height: 8),
      const SizedBox(height: 8),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKPickerSlider:')),
      Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 100,
                child: CDKPickerSlider(
                  value: _valueSlider,
                  onChanged: (value) {
                    setState(() {
                      _valueSlider = value;
                    });
                  },
                ))),
        Text(_valueSlider.toStringAsFixed(2),
            style: const TextStyle(fontSize: 12)),
      ]),
      const SizedBox(height: 8),
      const Padding(
          padding: EdgeInsets.all(8),
          child: Text('CDKPickerButtonsSegmented:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 300,
                child: CDKPickerButtonsSegmented(
                  selectedIndex: _selectedIndexButtonsSegmented0,
                  options: const [
                    Text('Car'),
                    Text('Motorbike'),
                    Icon(CupertinoIcons.airplane)
                  ],
                  onSelected: (int index) {
                    setState(() {
                      _selectedIndexButtonsSegmented0 = index;
                    });
                  },
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 250,
                child: CDKPickerButtonsSegmented(
                  selectedIndex: _selectedIndexButtonsSegmented1,
                  options: const [
                    Icon(CupertinoIcons.ant),
                    Text('Flower'),
                    Text('Grass'),
                    Text('Bush')
                  ],
                  isAccent: true,
                  onSelected: (int index) {
                    setState(() {
                      _selectedIndexButtonsSegmented1 = index;
                    });
                  },
                ))),
      ]),
      const SizedBox(height: 8),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKPickerButtonsBar:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 300,
                child: CDKPickerButtonsBar(
                  selectedStates: _selectedStatesButtonsBar0,
                  options: const [
                    Icon(CupertinoIcons.text_alignleft),
                    Icon(CupertinoIcons.text_aligncenter),
                    Icon(CupertinoIcons.text_alignright),
                    Text("Justify")
                  ],
                  onChanged: (List<bool> options) {
                    setState(() {
                      _selectedStatesButtonsBar0 = options;
                    });
                  },
                ))),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 250,
                child: CDKPickerButtonsBar(
                  selectedStates: _selectedStatesButtonsBar1,
                  options: const [
                    Icon(CupertinoIcons.bold),
                    Icon(CupertinoIcons.italic),
                    Icon(CupertinoIcons.underline),
                    Icon(CupertinoIcons.strikethrough)
                  ],
                  allowsMultipleSelection: true,
                  onChanged: (List<bool> options) {
                    setState(() {
                      _selectedStatesButtonsBar1 = options;
                    });
                  },
                ))),
      ]),
      const SizedBox(height: 8),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKPickerSliderGradient:')),
      Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
                width: 100,
                height: 16,
                child: CDKPickerSliderGradient(
                  colors: _valueSliderColors,
                  stops: _valueSliderStops,
                  value: _valueSliderGradient,
                  onChanged: (value, color) {
                    setState(() {
                      _valueSliderGradient = value;
                      valueSliderGradientColor = color;
                    });
                  },
                ))),
        Container(width: 10, height: 10, color: valueSliderGradientColor),
        Text(_valueSliderGradient.toStringAsFixed(2),
            style: const TextStyle(fontSize: 12)),
      ]),
      const SizedBox(height: 50),
    ]);
  }
}
