import 'package:home_portal/services/autodiscovery/autodiscovery_service.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

import '../../../app/app.router.dart';
import 'setup_view.form.dart';

class SetupModel extends FormViewModel {
  AutodiscoveryService _autodiscoveryService = locator<AutodiscoveryService>();
  DialogService _dialogService = locator<DialogService>();
  SettingsService _settingsService = locator<SettingsService>();
  NavigationService _navigationService = locator<NavigationService>();

  int? _port;
  String? _host;

  void init() async {
    _autodiscoveryService.init();
  }

  List<String> get hassInstances => _autodiscoveryService.hassInstances;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_autodiscoveryService];

  @override
  void setFormStatus() {
    if (portValue != null) {
      var port = int.tryParse(portValue!);
      if (port != null && port > 0 && port < 65535) {
        _port = port;
      } else {
        setPortValidationMessage("Invalid port");
      }
    } else {
      setPortValidationMessage("Port is required");
    }
    if (hostValue != null) {
      if ((hostValue!.startsWith("http://") && hostValue!.length > 7) ||
          (hostValue!.startsWith("https://") && hostValue!.length > 8)) {
        _host = hostValue!;
      } else {
        setHostValidationMessage(
            "Invalid host. Must contain http:// or https://");
      }
    } else {
      setHostValidationMessage("Host is required");
    }
  }

  Future<void> connectManual() async {
    connect("$_host:$_port");
  }

  Future<void> connect(String address) async {
    try {
      var res = await get(Uri.parse(address));

      if (res.statusCode == 200 &&
          res.body.contains("<title>Home Assistant</title>")) {
        _settingsService.internalUrl = address;
        _navigationService.navigateTo(Routes.authView);

        return;
      }
    } catch (e) {}
    _dialogService.showDialog(
      title: "Error",
      description:
          "Could not connect to $address or is not a Home Assistant instance",
    );
  }
}
