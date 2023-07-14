import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/hass/hass_service.dart';

class ViewSelectorModel extends BaseViewModel {
  final _hassService = locator<HassService>();
  final _navigationService = locator<NavigationService>();

  String currentView;

  ViewSelectorModel(this.currentView);

  List<LovelaceView> get views => _hassService.lovelaceViews;

  bool get ready => _hassService.ready;

  void onViewSelected(int index) {
    _navigationService.back(result: views[index].path);
  }

  void onMagicMirrorModeSelected() {
    _navigationService.back(result: "mirror");
  }
}
