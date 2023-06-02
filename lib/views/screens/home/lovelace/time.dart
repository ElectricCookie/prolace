import 'dart:async';

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

  String leadingZero(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var time =
        "${leadingZero(now.hour)}:${leadingZero(now.minute)}:${leadingZero(now.second)}";

    return Text(time);
  }
}
