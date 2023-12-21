import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/colors.dart';
import 'package:home_portal/views/screens/home/activities/activities_view.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/lovelace_page.dart';
import 'package:home_portal/views/screens/home/lovelace/time.dart';
import 'package:home_portal/views/screens/mirror/mirror_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'lovelace/card.dart';
import 'lovelace/icons.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeModel>.reactive(
        viewModelBuilder: () => HomeModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => const LovelaceWrapper());
  }
}

class LovelaceWrapper extends StackedHookView<HomeModel> {
  const LovelaceWrapper({super.key});

  @override
  Widget builder(BuildContext context, model) {
    if (!model.ready || model.lovelaceViews.isEmpty) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }

    if (!model.screenOn) {
      return GestureDetector(
          onTap: () {
            model.wake();
          },
          child: Scaffold(
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DefaultTextStyle(
                      style: TextStyle(fontSize: 32, color: Colors.white),
                      child: TimeView()),
                  const SizedBox(height: 16),
                  ...model.screenSaverEntities
                      .map(
                        (e) => CardView(
                          LovelaceCard(
                              entity: e, type: "custom:mushroom-entity-card"),
                          onScreenSaver: true,
                        ),
                      )
                      .toList(),
                ],
              ),
            )),
          ));
    }

    if (model.allowNavigation) {
      return DynamicTabBar(
        appBar: Column(
          children: [
            ActivitiesView(
              appBarBuilder: (context, textColor, hasTimers) => Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: borderColor(context)))),
                padding: EdgeInsets.symmetric(
                    vertical: hasTimers ? 4 : 8, horizontal: 16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: hasTimers ? 14 : 24,
                            fontWeight: FontWeight.bold,
                            color: hasTimers
                                ? Theme.of(context).colorScheme.onPrimary
                                : textColor,
                          ),
                          child: const TimeView(),
                        ),
                        if (!hasTimers)
                          DefaultTextStyle(
                            style: TextStyle(
                                color: hasTimers
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : textColor),
                            child: const DateView(),
                          ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: textColor,
                      ),
                      onPressed: () {
                        var navigationService = locator<NavigationService>();
                        navigationService.navigateTo(Routes.settingsView);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        initialIndex: model.likelyView,
        tabs: model.lovelaceViews
            .where(
              (element) => element.visible?.isEmpty != true,
            )
            .map((view) => BottomNavigationBarItem(
                label: view.title ?? "",
                icon: Icon(
                  getIcon(view.icon ?? ""),
                  color: Theme.of(context).colorScheme.onBackground,
                )))
            .toList(),
        children:
            model.lovelaceViews.map((view) => LovelacePage(view)).toList(),
      );
    } else {
      if (model.isMirror) {
        return const MirrorView();
      }

      return Scaffold(
          appBar: buildHomeAppbar(context),
          body: LovelacePage(model.pinnedView));
    }
  }
}

buildHomeAppbar(BuildContext context) {
  return AppBar(
    title: const TimeView(),
    actions: [
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          var navigationService = locator<NavigationService>();
          navigationService.navigateTo(Routes.settingsView);
        },
      )
    ],
  );
}

class DynamicTabBar extends StatefulWidget {
  final List<Widget> children;
  final Widget? appBar;
  final int initialIndex;
  final List<BottomNavigationBarItem> tabs;

  const DynamicTabBar(
      {super.key,
      required this.children,
      this.appBar,
      required this.tabs,
      this.initialIndex = 0});

  @override
  State<DynamicTabBar> createState() => _DynamicTabBarState();
}

class _DynamicTabBarState extends State<DynamicTabBar>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late PageController _tabController;

  int _lastIndex = 0;

  @override
  void initState() {
    _tabController = PageController(initialPage: widget.initialIndex);

    WidgetsBinding.instance.addObserver(this);

    _tabController.addListener(() {
      if (_tabController.page?.round() != _lastIndex) {
        _lastIndex = _tabController.page?.round() ?? 0;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _tabController.jumpToPage(widget.initialIndex);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: navigationBarColor(context),
          boxShadow: [
            BoxShadow(
                color: shadowColor(context),
                blurRadius: 16,
                offset: const Offset(0, -2))
          ],
        ),
        child: BottomNavigationBar(
          items: widget.tabs,
          elevation: 3,
          backgroundColor: navigationBarColor(context),
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onBackground,
          currentIndex: _tabController.hasClients
              ? _tabController.page?.round() ?? 0
              : widget.initialIndex,
          onTap: (value) async {
            await _tabController.animateToPage(value,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut);
            setState(() {});
          },
        ),
      ),
      body: Column(
        children: [
          if (widget.appBar != null) widget.appBar!,
          Expanded(
            child: PageView(
              controller: _tabController,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}
