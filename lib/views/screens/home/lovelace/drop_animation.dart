import 'package:flutter/material.dart';

class DropAnimation extends StatefulWidget {
  Widget child;
  Duration delay;
  DropAnimation({required this.child, required this.delay});

  @override
  State<DropAnimation> createState() => _DropAnimationState();
}

class _DropAnimationState extends State<DropAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _init();
    super.initState();
  }

  void _init() async {
    await Future.delayed(widget.delay);
    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          var curve = CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut);
          var scale = CurvedAnimation(
              parent: _animationController, curve: Curves.elasticOut);
          return Opacity(
            opacity: curve.value,
            child: Transform.scale(
              scale: (1 - scale.value) * 0.5 + 1,
              child: Transform.translate(
                  offset: Offset(0, (1 - curve.value) * 10),
                  child: widget.child),
            ),
          );
        });
  }
}
