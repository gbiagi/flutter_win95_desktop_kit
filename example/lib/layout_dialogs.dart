import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutDialogs extends StatefulWidget {
  const LayoutDialogs({super.key});

  @override
  State<LayoutDialogs> createState() => _LayoutDialogsState();
}

class _LayoutDialogsState extends State<LayoutDialogs> {
  // Used to tell the popover where to show up
  final GlobalKey<CDKDialogPopoverState> _anchorPopoverSlider = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorPopover0 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorPopover1 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorPopover2 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorPopover3 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorDraggable0 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorDraggable1 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorDraggable2 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorDraggable3 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorArrowed0 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorArrowed1 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorArrowed2 = GlobalKey();
  final GlobalKey<CDKDialogPopoverState> _anchorArrowed3 = GlobalKey();
  final ValueNotifier<double> _sliderValueNotifier = ValueNotifier(0.5);

  _showPopover(BuildContext context, GlobalKey anchorKey, CDKTheme theme,
      bool centered, bool animated, bool translucent) {
    final GlobalKey<CDKDialogPopoverState> key = GlobalKey();
    if (anchorKey.currentContext == null) {
      // ignore: avoid_print
      print("Error: anchorKey not assigned to a widget");
      return;
    }
    CDKDialogsManager.showPopover(
      key: key,
      context: context,
      anchorKey: anchorKey,
      type: centered ? CDKDialogPopoverType.center : CDKDialogPopoverType.down,
      isAnimated: false,
      isTranslucent: false,
      onHide: () {
        // ignore: avoid_print
        print("hide popover $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Popover:", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                key.currentState?.hide();
              },
              child: Text('Close popover',
                  style: TextStyle(fontSize: 12, color: theme.accent)),
            ),
          ],
        ),
      ),
    );
  }

  _showModal(
      BuildContext context, CDKTheme theme, bool animated, bool translucent) {
    final GlobalKey<CDKDialogModalState> key = GlobalKey();
    CDKDialogsManager.showModal(
      key: key,
      context: context,
      isAnimated: false,
      isTranslucent: false,
      onHide: () {
        // ignore: avoid_print
        print("hide modal $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Modal:", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 300, height: 300),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                key.currentState?.hide();
              },
              child: Text('Close modal',
                  style: TextStyle(fontSize: 12, color: theme.accent)),
            ),
          ],
        ),
      ),
    );
  }

  void _showDraggable(BuildContext context, GlobalKey anchorKey, CDKTheme theme,
      bool animated, bool translucent) {
    final GlobalKey<CDKDialogDraggableState> key = GlobalKey();
    if (anchorKey.currentContext == null) {
      // ignore: avoid_print
      print("Error: anchorKey not assigned to a widget");
      return;
    }
    CDKDialogsManager.showDraggable(
      key: key,
      context: context,
      anchorKey: anchorKey,
      isAnimated: false,
      isTranslucent: false,
      onHide: () {
        // ignore: avoid_print
        print("hide draggable $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Draggable:", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 400, height: 250),
            const SizedBox(height: 10),
            GestureDetector(
              onPanUpdate: (details) {}, // prevent dragging
              onTap: () {
                key.currentState?.hide();
              },
              child: Text('Close draggable',
                  style: TextStyle(fontSize: 12, color: theme.accent)),
            ),
          ],
        ),
      ),
    );
  }

  _showPopoverArrowed(BuildContext context, GlobalKey anchorKey, CDKTheme theme,
      bool animated, bool translucent) {
    final GlobalKey<CDKDialogPopoverArrowedState> key = GlobalKey();
    if (anchorKey.currentContext == null) {
      // ignore: avoid_print
      print("Error: anchorKey not assigned to a widget");
      return;
    }
    CDKDialogsManager.showPopoverArrowed(
      key: key,
      context: context,
      anchorKey: anchorKey,
      isAnimated: false,
      isTranslucent: false,
      onHide: () {
        // ignore: avoid_print
        print("hide arrowed $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Arrowed:", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                key.currentState?.hide();
              },
              child: Text('Close arrowed',
                  style: TextStyle(fontSize: 12, color: theme.accent)),
            ),
          ],
        ),
      ),
    );
  }

  _showDialogArrowedSlider(
      BuildContext context, GlobalKey anchorKey, CDKTheme theme) {
    final GlobalKey<CDKDialogPopoverArrowedState> key = GlobalKey();
    if (anchorKey.currentContext == null) {
      // ignore: avoid_print
      print("Error: anchorKey not assigned to a widget");
      return;
    }
    CDKDialogsManager.showPopoverArrowed(
      key: key,
      context: context,
      anchorKey: anchorKey,
      isAnimated: true,
      isTranslucent: false,
      onHide: () {
        // ignore: avoid_print
        print("hide slider $key");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<double>(
            valueListenable: _sliderValueNotifier,
            builder: (context, value, child) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Slider:", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(value.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 12)),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: CDKPickerSlider(
                        value: value,
                        onChanged: (value) {
                          _sliderValueNotifier.value = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Using a value notifier to',
                        style: TextStyle(fontSize: 12)),
                    const Text('communicate with the dialog.',
                        style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        key.currentState?.hide();
                      },
                      child: Text('Close slider',
                          style: TextStyle(fontSize: 12, color: theme.accent)),
                    ),
                  ]);
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;

    return ListView(children: [
      const SizedBox(height: 8),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButton(
              key: _anchorPopover0,
              style: CDKButtonStyle.normal,
              isLarge: false,
              onPressed: () {
                _showPopover(
                    context, _anchorPopover0, theme, false, false, false);
              },
              child: const Text('Popover'),
            )),
      ]),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKDialogModal:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButton(
              style: CDKButtonStyle.normal,
              isLarge: false,
              onPressed: () {
                _showModal(context, theme, false, false);
              },
              child: const Text('Modal'),
            )),
      ]),
      const Padding(
          padding: EdgeInsets.all(8), child: Text('CDKDialogDraggable:')),
      Wrap(children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButton(
              key: _anchorDraggable0,
              style: CDKButtonStyle.normal,
              isLarge: false,
              onPressed: () {
                _showDraggable(context, _anchorDraggable0, theme, false, false);
              },
              child: const Text('Draggable'),
            )),
      ]),
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKDialogArrow:')),
      Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: CDKButton(
              key: _anchorPopoverSlider,
              style: CDKButtonStyle.normal,
              isLarge: false,
              onPressed: () {
                _showDialogArrowedSlider(context, _anchorPopoverSlider, theme);
              },
              child: const Text('DialogArrow with slider'),
            )),
        ValueListenableBuilder<double>(
          valueListenable: _sliderValueNotifier,
          builder: (context, value, child) {
            return Text('Slider value: ${value.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12));
          },
        )
      ]),
      const SizedBox(height: 50),
    ]);
  }
}
