import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_portal/views/colors.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final bool show;
  final Color? color;
  final Gradient? gradient;
  final double step;

  final Function(double) onChanged;

  const CustomSlider({
    Key? key,
    required this.value,
    required this.min,
    required this.onChanged,
    this.gradient,
    this.color,
    this.show = true,
    required this.max,
    this.step = 1,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _valueController;

  @override
  void initState() {
    _valueController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _valueController.value =
        (widget.value - widget.min) / (widget.max - widget.min);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomSlider oldWidget) {
    if (oldWidget.value != widget.value) {
      setState(() {
        _valueController.animateTo(
            (widget.value - widget.min) / (widget.max - widget.min),
            curve: Curves.easeInOut);
      });
      _controller.reverse(from: 1);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    const sliderHeight = 42.0;
    const radius = 12.0;

    final sliderColor = widget.color ?? Colors.yellow.shade600;

    final onSliderColor =
        sliderColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.show ? sliderHeight : 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: !widget.show
              ? null
              : Border.all(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: borderColor(context),
                ),
        ),
        clipBehavior: Clip.hardEdge,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragStart: (details) {
              _controller.value = 1;
              _valueController.stop();
            },
            onHorizontalDragUpdate: (details) {
              HapticFeedback.lightImpact();
              setState(() {
                var value = _valueController.value +=
                    (details.delta.dx) / constraints.maxWidth;

                _valueController.value = value.clamp(0, 1);
              });
            },
            onTapUp: (TapUpDetails details) {
              var value = (details.localPosition.dx) / constraints.maxWidth;

              _valueController.value = value.clamp(0, 1);
              widget.onChanged(
                  _valueController.value * (widget.max - widget.min) +
                      widget.min);
            },
            onHorizontalDragEnd: (details) {
              _controller.reverse(from: 1);
              widget.onChanged(
                  _valueController.value * (widget.max - widget.min) +
                      widget.min);
            },
            child: Stack(children: [
              AnimatedBuilder(
                animation: _valueController,
                builder: (context, child) {
                  return Row(
                    children: [
                      Flexible(
                        flex: (_valueController.value * 100).round(),
                        child: Container(
                          height: sliderHeight,
                          decoration: BoxDecoration(
                            color: widget.gradient != null ? null : sliderColor,
                            gradient: widget.gradient,
                          ),
                          child: Stack(
                            children: [
                              if (_valueController.value >= 0.5)
                                Align(
                                    alignment: Alignment.center,
                                    child: AnimatedFlipCounter(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      textStyle:
                                          TextStyle(color: onSliderColor),
                                      value: (_valueController.value *
                                                  (widget.max - widget.min) +
                                              widget.min)
                                          .round(),
                                    )),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Transform.translate(
                                  offset: const Offset(6, 0),
                                  child: Container(
                                    height: sliderHeight - 10,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 0),
                                        )
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: (100 - (_valueController.value * 100)).round(),
                        child: SizedBox(
                          height: sliderHeight,
                          child: Stack(children: [
                            if (_valueController.value < 0.5)
                              Align(
                                  alignment: Alignment.center,
                                  child: AnimatedFlipCounter(
                                    duration: const Duration(milliseconds: 500),
                                    textStyle: TextStyle(color: sliderColor),
                                    value: (_valueController.value *
                                                (widget.max - widget.min) +
                                            widget.min)
                                        .round(),
                                  )),
                          ]),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ]),
          );
        }));
  }
}
