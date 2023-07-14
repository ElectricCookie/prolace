import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
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
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => const LovelaceWrapper());
  }
}

class LovelaceWrapper extends HookViewModelWidget<HomeModel> {
  const LovelaceWrapper({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, viewModel) {
    if (!viewModel.ready || viewModel.lovelaceViews.isEmpty) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }

    if (!viewModel.screenOn) {
      return GestureDetector(
          onTap: () {
            viewModel.wake();
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
                  ...viewModel.screenSaverEntities
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

    if (viewModel.allowNavigation) {
      return DynamicTabBar(
        initialIndex: viewModel.likelyView,
        tabs: viewModel.lovelaceViews
            .where(
              (element) => element.visible?.isEmpty != true,
            )
            .map((view) => BottomNavigationBarItem(
                backgroundColor: Colors.grey.shade900,
                label: view.title ?? "",
                icon: Icon(getIcon(view.icon ?? ""))))
            .toList(),
        children:
            viewModel.lovelaceViews.map((view) => LovelacePage(view)).toList(),
      );
    } else {
      if (viewModel.isMirror) {
        return MirrorView();
      }

      return Scaffold(
          appBar: buildHomeAppbar(context),
          body: LovelacePage(viewModel.pinnedView));
    }
  }
}

buildHomeAppbar(BuildContext context) {
  return AppBar(
    elevation: 1,
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
  final int initialIndex;
  final List<BottomNavigationBarItem> tabs;

  const DynamicTabBar(
      {super.key,
      required this.children,
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
      appBar: buildHomeAppbar(context),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade200,
        selectedItemColor: Colors.white,
        items: widget.tabs,
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
      body: PageView(
        controller: _tabController,
        children: widget.children,
      ),
    );
  }
}
