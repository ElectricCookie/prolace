import 'package:flutter/material.dart';
import 'package:home_portal/app/app.locator.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InternalSsidView extends StackedView<InternalSsidViewModel> {
  const InternalSsidView({super.key});

  @override
  Widget builder(
      BuildContext context, InternalSsidViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internal SSIDs'),
      ),
      body: ListView.builder(
        itemCount: viewModel.internalSsids.length +
            (viewModel.currentSsidIsInternal ? 0 : 1),
        itemBuilder: (context, index) {
          if (index == viewModel.internalSsids.length) {
            return ListTile(
              onTap: () {
                viewModel.onTapAddCurrentSsid();
              },
              title: Text('Add Current SSID: ${viewModel.currentSsid}'),
            );
          }

          return ListTile(
            onTap: () {
              viewModel.onTapSsid(index);
            },
            trailing: const Icon(Icons.delete),
            title: Text(viewModel.internalSsids[index]),
          );
        },
      ),
    );
  }

  @override
  void onViewModelReady(InternalSsidViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  InternalSsidViewModel viewModelBuilder(BuildContext context) {
    return InternalSsidViewModel();
  }
}

class InternalSsidViewModel extends BaseViewModel {
  final _settingsService = locator<SettingsService>();
  final _dialogService = locator<DialogService>();

  List<String> get internalSsids => _settingsService.internalSsids;

  String _currentSsid = '';

  String get currentSsid => _currentSsid;

  init() async {
    final info = NetworkInfo();
    _currentSsid = (await info.getWifiName()) ?? '';
    notifyListeners();
  }

  bool get currentSsidIsInternal => internalSsids.contains(_currentSsid);

  void onTapAddCurrentSsid() async {
    if (_currentSsid.isNotEmpty) {
      _settingsService.addInternalSsid(_currentSsid);
      notifyListeners();
    }
  }

  void onTapSsid(int index) async {
    final res = await _dialogService.showConfirmationDialog(
      title: "Remove SSID",
      description:
          "Are you sure you want to remove ${internalSsids[index]} from the list of internal SSIDs?",
    );

    if (res != null) {
      if (res.confirmed) {
        _settingsService.removeInternalSsid(internalSsids[index]);
        notifyListeners();
      }
    }
  }
}
