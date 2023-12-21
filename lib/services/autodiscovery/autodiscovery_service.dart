import 'dart:async';

import 'package:bonsoir/bonsoir.dart';
import 'package:stacked/stacked.dart';

String hassAutoDiscoveryService = "_home-assistant._tcp";

class AutodiscoveryService with ListenableServiceMixin {
  final _hassInstances = ReactiveList<String>();

  List<String> get hassInstances => _hassInstances;

  AutodiscoveryService() {
    listenToReactiveValues([_hassInstances]);
  }

  StreamSubscription<BonsoirEvent>? _subscription;
  BonsoirDiscovery? _discovery;

  // setup bonsoir
  void init() async {
    _discovery = BonsoirDiscovery(type: hassAutoDiscoveryService);
    await _discovery!.ready;
    await _discovery!.start();

    _subscription = _discovery!.eventStream?.listen((event) {
      if (event.type == BonsoirDiscoveryEventType.DISCOVERY_SERVICE_RESOLVED) {
        var service = event.service as ResolvedBonsoirService;
        var serviceAddress = "${service.ip}:${service.port}";
        if (_hassInstances.contains(serviceAddress)) {
          return;
        } else {
          _hassInstances.add(serviceAddress);
        }
      }
    });
  }

  void dispose() {
    _subscription?.cancel();
    _discovery?.stop();
  }
}
