// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// TODO(dragostis): Missing functionality:
//   * mobile horizontal mode with adding/removing steps
//   * alternative labeling
//   * stepper feedback in the case of high-latency interactions

/// The state of a [Step] which is used to control the style of the circle and
/// text.
///
/// See also:
///
///  * [Step]
enum CustomStepState {
  /// A step that displays its index in its circle.
  indexed,

  /// A step that displays a pencil icon in its circle.
  editing,

  /// A step that displays a tick icon in its circle.
  complete,

  /// A step that is disabled and does not to react to taps.
  disabled,

  /// A step that is currently having an error. e.g. the use has submitted wrong
  /// input.
  error,
}

/// Defines the [Stepper]'s main axis.
enum CustomStepperType {
  /// A vertical layout of the steps with their content in-between the titles.
  vertical,

  /// A horizontal layout of the steps with their content below the titles.
  horizontal,
}

const TextStyle _kStepStyle = const TextStyle(
  fontSize: 18.0,
  color: const Color(0xFF888888),
);
const Color _kErrorLight = Colors.red;
final Color _kErrorDark = Colors.red.shade400;
const Color _kCircleActiveLight = Colors.white;
const Color _kCircleActiveDark = Colors.black87;
const Color _kDisabledLight = Colors.black38;
const Color _kDisabledDark = Colors.white30;
const double _kStepSize = 40.0;
const double _kTriangleHeight =
    _kStepSize * 0.866025; // Triangle height. sqrt(3.0) / 2.0

/// A material step used in [Stepper]. The step can have a title and subtitle,
/// an icon within its circle, some content and a state that governs its
/// styling.
///
/// See also:
///
///  * [Stepper]
///  * <https://material.google.com/components/steppers.html>
@immutable
class CustomStep {
  /// Creates a step for a [Stepper].
  ///
  /// The [title], [content], and [state] arguments must not be null.
  const CustomStep({
    @required this.title,
    this.subtitle,
    @required this.content,
    this.state = StepState.indexed,
    this.isActive = false,
  })  : assert(title != null),
        assert(content != null),
        assert(state != null);

  /// The title of the step that typically describes it.
  final Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget subtitle;

  /// The content of the step that appears below the [title] and [subtitle].
  ///
  /// Below the content, every step has a 'continue' and 'cancel' button.
  final Widget content;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final StepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;
}

/// A material stepper widget that displays progress through a sequence of
/// steps. Steppers are particularly useful in the case of forms where one step
/// requires the completion of another one, or where multiple steps need to be
/// completed in order to submit the whole form.
///
/// The widget is a flexible wrapper. A parent class should pass [currentStep]
/// to this widget based on some logic triggered by the three callbacks that it
/// provides.
///
/// See also:
///
///  * [Step]
///  * <https://material.google.com/components/steppers.html>
class CustomStepper extends StatefulWidget {
  /// Creates a stepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old stepper from the
  /// new one.
  ///
  /// The [steps], [type], and [currentStep] arguments must not be null.
  CustomStepper(
      {Key key,
      @required this.steps,
      this.type = StepperType.vertical,
      this.currentStep = 0,
      this.isVisible = true})
      : assert(steps != null),
        assert(type != null),
        assert(currentStep != null),
        assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  /// The steps of the stepper whose titles, subtitles, icons always get shown.
  ///
  /// The length of [steps] must not change.
  final List<CustomStep> steps;

  /// The type of stepper that determines the layout. In the case of
  /// [StepperType.horizontal], the content of the current step is displayed
  /// underneath as opposed to the [StepperType.vertical] case where it is
  /// displayed in-between.
  final StepperType type;

  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  final bool isVisible;

  @override
  _StepperState createState() => new _StepperState();
}

class _StepperState extends State<CustomStepper> with TickerProviderStateMixin {
  List<GlobalKey> _keys;
  final Map<int, StepState> _oldStates = <int, StepState>{};

  @override
  void initState() {
    super.initState();
    _keys = new List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => new GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1)
      _oldStates[i] = widget.steps[i].state;
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1)
      _oldStates[i] = oldWidget.steps[i].state;
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }


  Color _circleColor(int index) {
    return widget.steps[index].isActive
        ? Colors.orange
        : const Color(0xFFE0E0E0);
  }

  Widget _buildCircle(int index, bool oldState) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: 20.0,
      height: 20.0,
      child: new Container(
        decoration: new BoxDecoration(
          border: Border.all(width: 2.0,color: _circleColor(index)),
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    return _buildCircle(index, false);
  }

  TextStyle _titleStyle(int index) {
    return new TextStyle(
        fontFamily: 'Avenir-Black',
        color: widget.steps[index].isActive ? Colors.orange : Colors.grey,
        fontSize: 11.0);
  }

  TextStyle _subtitleStyle(int index) {
    return new TextStyle(
        fontFamily: 'Avenir-Black',
        color: widget.steps[index].isActive ? Colors.orange : Colors.grey,
        fontSize: 12.0);
  }

  Widget _buildHeaderText(int index) {
    final List<Widget> children = <Widget>[
      new DefaultTextStyle(
        style: _titleStyle(index),
        child: widget.steps[index].title,
      ),
    ];

    if (widget.steps[index].subtitle != null)
      children.add(
        new Container(
          child: new DefaultTextStyle(
            style: _subtitleStyle(index),
            child: widget.steps[index].subtitle,
          ),
        ),
      );

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children);
  }

  Widget _buildHorizontal() {
    final List<Widget> children = <Widget>[];

    for (int i = 0; i < widget.steps.length; i += 1) {
      children.add(new Container(
        margin: const EdgeInsets.only(top:24.0),
        width: 60.0,
        child: new Column(
          children: <Widget>[
            new Container(
              child: _buildHeaderText(i),
            ),
            new Container(
              child: new Center(
                child: _buildIcon(i),
              ),
            ),
          ],
        ),
      ));

      if (!_isLast(i)) {
        children.add(
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(top: 34.0),
              height: 1.0,
              color: Colors.grey.shade400,
            ),
          ),
        );
      }
    }

    return new ListView(
      children: <Widget>[
        new Material(
          child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: new Row(
              children: widget.isVisible ? children : <Widget>[],
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: widget.steps[widget.currentStep].content,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(() {
      if (context.ancestorWidgetOfExactType(Stepper) != null)
        throw new FlutterError(
            'Steppers must not be nested. The material specification advises '
            'that one should avoid embedding steppers within steppers. '
            'https://material.google.com/components/steppers.html#steppers-usage\n');
      return true;
    }());
    return _buildHorizontal();
  }
}

// Paints a triangle whose base is the bottom of the bounding rectangle and its
// top vertex the middle of its top.
class _TrianglePainter extends CustomPainter {
  _TrianglePainter({this.color});

  final Color color;

  @override
  bool hitTest(Offset point) => true; // Hitting the rectangle is fine enough.

  @override
  bool shouldRepaint(_TrianglePainter oldPainter) {
    return oldPainter.color != color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double base = size.width;
    final double halfBase = size.width / 2.0;
    final double height = size.height;
    final List<Offset> points = <Offset>[
      new Offset(0.0, height),
      new Offset(base, height),
      new Offset(halfBase, 0.0),
    ];

    canvas.drawPath(
      new Path()..addPolygon(points, true),
      new Paint()..color = color,
    );
  }
}
