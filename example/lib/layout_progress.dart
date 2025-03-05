import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutProgress extends StatefulWidget {
  const LayoutProgress({super.key});

  @override
  State<LayoutProgress> createState() => _LayoutProgressState();
}

class _LayoutProgressState extends State<LayoutProgress> {
  double _progressL = 0.0;
  bool _isRunningL = false;
  double _progressC = 0.0;
  final bool _isRunningC = false;

  bool _isImageVisible = false;

  void _toggleIndeterminateL() {
    setState(() {
      _isRunningL = !_isRunningL;
    });
  }

  void _increaseProgressL() {
    setState(() {
      _progressL = (_progressL + 0.1);
      if (_progressL > 1) {
        _progressL = 0.0;
      }
    });
  }

  void _toggleIndeterminateC() {
    setState(() {
      _isImageVisible = !_isImageVisible;
    });
  }

  void _increaseProgressC() {
    setState(() {
      _progressC = (_progressC + 0.1);
      if (_progressC > 1) {
        _progressC = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(height: 8),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKProgressBar:')),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                    width: 250,
                    child: CDKProgressBar(
                      value: _progressL,
                    ))),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(_progressL.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 12)),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: CDKButton(
                  style: CDKButtonStyle.normal,
                  onPressed: () {
                    _increaseProgressL();
                  },
                  child: const Text('Increase'),
                )),
          ]),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                    width: 250,
                    child: CDKProgressBar(
                      value: _progressL,
                      isIndeterminate: true,
                      isRunning: _isRunningL,
                    ))),
            Padding(
                padding: const EdgeInsets.all(8),
                child: CDKButton(
                  style: CDKButtonStyle.normal,
                  onPressed: () {
                    _toggleIndeterminateL();
                  },
                  child: const Text('Toggle running'),
                )),
          ]),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKProgressCircular:')),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                    width: 250,
                    child: CDKProgressCircular(
                      value: _progressC,
                    ))),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(_progressC.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 12)),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: CDKButton(
                  style: CDKButtonStyle.normal,
                  onPressed: () {
                    _increaseProgressC();
                  },
                  child: const Text('Increase'),
                )),
          ]),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            if (_isImageVisible)
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset('assets/loading_clock.webp'))))
            else
              const SizedBox(width: 265, height: 115),
            Padding(
                padding: const EdgeInsets.all(8),
                child: CDKButton(
                  style: CDKButtonStyle.normal,
                  onPressed: () {
                    _toggleIndeterminateC();
                  },
                  child: const Text('Toggle running'),
                )),
          ]),
      const SizedBox(height: 50),
    ]);
  }
}
