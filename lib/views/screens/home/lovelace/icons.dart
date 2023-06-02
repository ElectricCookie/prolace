import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/entity.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/hass/hass_service.dart';

IconData getIcon(String icon, {Entity? entity}) {
  if (icon.isEmpty && entity != null) {
    icon = entity.icon ?? "";
  }

  if (icon.startsWith("mdi:")) {
    return MdiIcons.fromString(icon.substring("mdi:".length)) ??
        Icons.question_mark;
  }

  if (icon.isEmpty && entity != null) {
    return domainIcon(entity);
  }

  return Icons.question_mark;
}

IconData domainIcon(
  Entity entity,
) {
  final _hassService = locator<HassService>();

  var state = _hassService.state[entity.entityId];

  var attributes = state?.attributes ?? {};

  var compareState = state?.state ?? "";

  var domain = entity.entityId?.split(".").first;

  var deviceClass = attributes["device_class"];

  var unit = attributes["unit_of_measurement"];

  switch (domain) {
    case "button":
      switch (attributes["device_class"]) {
        case "restart":
          return MdiIcons.restart;
        case "update":
          return MdiIcons.update;
        default:
          return MdiIcons.gestureTapButton;
      }

    case "sensor":
      {
        // try the device class
        return FIXED_DEVICE_CLASS_ICONS[deviceClass] ??
            FIXED_UNIT_ICONS[unit] ??
            Icons.question_mark;
      }

    case "device_tracker":
      return compareState == "not_home"
          ? MdiIcons.accountArrowRight
          : MdiIcons.account;

    case "switch":
      switch (deviceClass) {
        case "outlet":
          return compareState == "on"
              ? MdiIcons.powerPlug
              : MdiIcons.powerPlugOff;
        case "switch":
          return compareState == "on"
              ? MdiIcons.toggleSwitchVariant
              : MdiIcons.toggleSwitchVariantOff;
        default:
          return MdiIcons.toggleSwitchVariant;
      }

    case "humidifier":
      return compareState == "off"
          ? MdiIcons.airHumidifierOff
          : MdiIcons.airHumidifier;

    case "input_boolean":
      return compareState == "on"
          ? MdiIcons.checkCircleOutline
          : MdiIcons.closeCircleOutline;
  }

  return Icons.question_mark;
  /*

    case "input_datetime":
      if (!stateObj?.attributes.has_date) {
        return mdiClock;
      }
      if (!stateObj.attributes.has_time) {
        return mdiCalendar;
      }
      break;

    case "lock":
      switch (compareState) {
        case "unlocked":
          return MdIcons.lockOpen;
        case "jammed":
          return MdIcons.lockAlert;
        case "locking":
        case "unlocking":
          return MdIcons.lockClock;
        default:
          return MdIcons.lock;
      }

    case "media_player":
      switch (stateObj?.attributes.device_class) {
        case "speaker":
          switch (compareState) {
            case "playing":
              return mdiSpeakerPlay;
            case "paused":
              return mdiSpeakerPause;
            case "off":
              return mdiSpeakerOff;
            default:
              return mdiSpeaker;
          }
        case "tv":
          switch (compareState) {
            case "playing":
              return mdiTelevisionPlay;
            case "paused":
              return mdiTelevisionPause;
            case "off":
              return mdiTelevisionOff;
            default:
              return mdiTelevision;
          }
        case "receiver":
          switch (compareState) {
            case "off":
              return mdiAudioVideoOff;
            default:
              return mdiAudioVideo;
          }
        default:
          switch (compareState) {
            case "playing":
            case "paused":
              return mdiCastConnected;
            case "off":
              return mdiCastOff;
            default:
              return mdiCast;
          }
      }

    case "person":
      return compareState === "not_home" ? mdiAccountArrowRight : mdiAccount;

    case "switch":
      switch (stateObj?.attributes.device_class) {
        case "outlet":
          return compareState === "on" ? mdiPowerPlug : mdiPowerPlugOff;
        case "switch":
          return compareState === "on"
            ? mdiToggleSwitchVariant
            : mdiToggleSwitchVariantOff;
        default:
          return mdiToggleSwitchVariant;
      }

    
    case "sun":
      return stateObj?.state === "above_horizon"
        ? FIXED_DOMAIN_ICONS[domain]
        : mdiWeatherNight;

    case "switch_as_x":
      return mdiSwapHorizontal;

    case "threshold":
      return mdiChartSankey;

    case "update":
      return compareState === "on"
        ? updateIsInstalling(stateObj as UpdateEntity)
          ? mdiPackageDown
          : mdiPackageUp
        : mdiPackage;

    case "weather":
      return weatherIcon(stateObj?.state);
  }

  if (domain in FIXED_DOMAIN_ICONS) {
    return FIXED_DOMAIN_ICONS[domain];
  }

  return undefined;*/
}

var FIXED_UNIT_ICONS = {
  "°C": MdiIcons.thermometer,
  "°F": MdiIcons.thermometer,
  "%": MdiIcons.waterPercent,
  "A": MdiIcons.currentAc,
  "Ah": MdiIcons.battery,
};

var FIXED_DEVICE_CLASS_ICONS = {
  "apparent_power": MdiIcons.flash,
  "aqi": MdiIcons.airFilter,
  "atmospheric_pressure": MdiIcons.thermometerLines,
  "carbon_dioxide": MdiIcons.moleculeCo2,
  "carbon_monoxide": MdiIcons.moleculeCo,
  "current": MdiIcons.currentAc,
  "data_rate": MdiIcons.transmissionTower,
  "data_size": MdiIcons.database,
  "date": MdiIcons.calendar,
  "distance": MdiIcons.arrowLeftRight,
  "duration": MdiIcons.progressClock,
  "energy": MdiIcons.lightningBolt,
  "frequency": MdiIcons.sineWave,
  "gas": MdiIcons.meterGas,
  "humidity": MdiIcons.waterPercent,
  "illuminance": MdiIcons.brightness5,
  "irradiance": MdiIcons.sunWireless,
  "moisture": MdiIcons.waterPercent,
  "monetary": MdiIcons.cash,
  "nitrogen_dioxide": MdiIcons.molecule,
  "nitrogen_monoxide": MdiIcons.molecule,
  "nitrous_oxide": MdiIcons.molecule,
  "ozone": MdiIcons.molecule,
  "pm1": MdiIcons.molecule,
  "pm10": MdiIcons.molecule,
  "pm25": MdiIcons.molecule,
  "power": MdiIcons.flash,
  "power_factor": MdiIcons.angleAcute,
  "precipitation": MdiIcons.weatherRainy,
  "precipitation_intensity": MdiIcons.weatherPouring,
  "pressure": MdiIcons.gauge,
  "reactive_power": MdiIcons.flash,
  "signal_strength": MdiIcons.wifi,
  "sound_pressure": MdiIcons.earHearing,
  "speed": MdiIcons.speedometer,
  "sulphur_dioxide": MdiIcons.molecule,
  "temperature": MdiIcons.thermometer,
  "timestamp": MdiIcons.clock,
  "volatile_organic_compounds": MdiIcons.molecule,
  "voltage": MdiIcons.sineWave,
  "volume": MdiIcons.carCoolantLevel,
  "water": MdiIcons.water,
  "weight": MdiIcons.weight,
  "wind_speed": MdiIcons.weatherWindy,
};
