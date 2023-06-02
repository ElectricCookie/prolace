import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final double step;
  final Function(double) onChanged;

  const CustomSlider({
    Key? key,
    required this.value,
    required this.min,
    required this.onChanged,
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

    _valueController.value = widget.value / (widget.max - widget.min);

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
        _valueController.animateTo(widget.value / (widget.max - widget.min),
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
    return Container(
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        clipBehavior: Clip.hardEdge,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragStart: (details) {
              _controller.forward();
              _valueController.stop();
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                var value = _valueController.value +=
                    (details.delta.dx) / constraints.maxWidth;
                print(value);
                _valueController.value = value.clamp(0, 1);
              });
            },
            onTapUp: (TapUpDetails details) {
              print(details.localPosition.dx);

              var value = (details.localPosition.dx) / constraints.maxWidth;
              print(value);
              _valueController.value = value.clamp(0, 1);
              widget.onChanged(
                  _valueController.value * (widget.max - widget.min));
            },
            onHorizontalDragEnd: (details) {
              _controller.reverse(from: 1);
              widget.onChanged(
                  _valueController.value * (widget.max - widget.min));
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
                          height: 32,
                          decoration:
                              BoxDecoration(color: Colors.yellow.shade600),
                        ),
                      ),
                      Flexible(
                        flex: (100 - (_valueController.value * 100)).round(),
                        child: Container(
                          height: 32,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Align(
                  alignment: Alignment.center,
                  child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Opacity(
                            opacity: _controller.value,
                            child: Text(
                              "${(_valueController.value * 100).round()}%",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16, height: 1),
                            ));
                      })),
            ]),
          );
        }));
  }
}
