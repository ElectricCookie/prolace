import 'dart:async';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class TimeView extends StatefulWidget {
  const TimeView({super.key});

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return Row(
      children: [
        AnimatedFlipCounter(
          value: now.hour,
          prefix: now.hour < 10 ? "0" : null,
        ),
        const Text(":"),
        AnimatedFlipCounter(
          value: now.minute,
          prefix: now.minute < 10 ? "0" : null,
        ),
        const Text(":"),
        AnimatedFlipCounter(
          value: now.second,
          prefix: now.second < 10 ? "0" : null,
        ),
      ],
    );
  }
}

class DateView extends StatelessWidget {
  const DateView({super.key});

  String get weekday {
    switch (DateTime.now().weekday) {
      case 1:
        return "Mo";
      case 2:
        return "Tu";
      case 3:
        return "We";
      case 4:
        return "Th";
      case 5:
        return "Fr";
      case 6:
        return "Sa";
      case 7:
        return "Su";
      default:
        return "";
    }
  }

  String leadingZero(int value) {
    if (value < 10) {
      return "0$value";
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return Text(
      "$weekday ${leadingZero(now.day)}.${leadingZero(now.month)}.${now.year}",
    );
  }
}
