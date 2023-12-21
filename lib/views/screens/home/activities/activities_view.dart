import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/views/colors.dart';
import 'package:home_portal/views/screens/home/activities/activities_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ActivitiesView extends StackedView<ActivitiesModel> {
  const ActivitiesView(
      {required this.appBarBuilder, this.onMirror = false, super.key});

  final bool onMirror;

  final Widget Function(BuildContext context, Color textColor, bool hasActivity)
      appBarBuilder;

  @override
  void onViewModelReady(ActivitiesModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, ActivitiesModel viewModel, Widget? child) {
    return Column(
      children: [
        if (viewModel.hasActiveTimers)
          Container(
            color: onMirror ? null : Theme.of(context).colorScheme.primary,
            child: SafeArea(
              child: AnimatedSize(
                curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    if (viewModel.activeTimers == 1)
                      for (final timer in viewModel.timers)
                        TimerWidget(
                          timer,
                          onMirror: onMirror,
                        )
                    else
                      TimerPageView(
                        children: [
                          for (final timer in viewModel.activeTimerEntities)
                            TimerWidget(
                              timer,
                              onMirror: onMirror,
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: viewModel.hasActiveTimers
                ? Theme.of(context).colorScheme.primary
                : navigationBarColor(context),
          ),
          child: SafeArea(
            top: !viewModel.hasActiveTimers,
            child: appBarBuilder(
              context,
              viewModel.hasActiveTimers
                  ? Theme.of(context).colorScheme.onPrimary
                  : textColor(context),
              viewModel.hasActiveTimers,
            ),
          ),
        ),
      ],
    );
  }

  @override
  ActivitiesModel viewModelBuilder(BuildContext context) {
    return ActivitiesModel();
  }
}

class TimerPageView extends StackedHookView<ActivitiesModel> {
  final List<Widget> children;

  const TimerPageView({required this.children, super.key});

  @override
  Widget builder(BuildContext context, ActivitiesModel model) {
    final controller = usePageController();

    useEffect(() {
      controller.addListener(() {
        model.activeTimer = controller.page!.round();
      });
      return null;
    });

    if (children.isEmpty) {
      return Container();
    }

    return Column(
      children: [
        DotsIndicator(
          dotsCount: children.length,
          decorator: DotsDecorator(
            size: const Size(8, 8),
            activeSize: const Size(8, 8),
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(100),
            activeColor: Theme.of(context).colorScheme.onPrimary,
          ),
          position: controller.hasClients ? controller.page ?? 0.0 : 0,
        ),
        SizedBox(
          height: 64,
          child: PageView(
            controller: controller,
            children: children,
          ),
        ),
      ],
    );
  }
}

class TimerWidget extends ViewModelWidget<ActivitiesModel> {
  final String timer;

  final bool onMirror;

  const TimerWidget(this.timer, {super.key, this.onMirror = false});

  @override
  Widget build(BuildContext context, ActivitiesModel viewModel) {
    final remaining = viewModel.getTimerDurationRemaining(timer);

    final hours = remaining.inHours;
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds.remainder(60);

    final state = viewModel.getTimerState(timer);

    if (state == TimerState.idle) {
      return Container();
    }

    return Container(
      height: 64,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          color: onMirror
              ? Colors.white
              : Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(32)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: onMirror
                ? Colors.black
                : Theme.of(context).colorScheme.primary.withAlpha(100),
            radius: 18,
            child: Icon(
              viewModel.getTimerIcon(timer),
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(viewModel.getTimerName(timer),
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16,
                        color: onMirror
                            ? Colors.black
                            : Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
                Text("Finish at ${viewModel.getTimerFinishTime(timer)}",
                    style: TextStyle(
                        fontSize: 12,
                        color: onMirror
                            ? Colors.black
                            : Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          if (state == TimerState.running || state == TimerState.paused)
            DefaultTextStyle(
              style: TextStyle(
                  fontSize: 24,
                  color: onMirror
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
              child: Row(children: [
                AnimatedFlipCounter(
                    value: hours, prefix: hours < 10 ? "0" : null),
                const Text(":"),
                AnimatedFlipCounter(
                    value: minutes, prefix: minutes < 10 ? "0" : null),
                const Text(":"),
                AnimatedFlipCounter(
                    value: seconds, prefix: seconds < 10 ? "0" : null),
              ]),
            )
                .animate(
                    onComplete: (controller) => state == TimerState.paused
                        ? controller.repeat(reverse: true)
                        : controller.stop())
                .fadeIn(duration: 1.seconds),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
