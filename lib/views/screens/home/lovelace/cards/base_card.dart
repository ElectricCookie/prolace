import 'package:flutter/material.dart';
import 'package:home_portal/app/app.locator.dart';
import 'package:home_portal/services/hass/hass_service.dart';
import 'package:home_portal/services/hass/models/entity.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/colors.dart';
import 'package:home_portal/views/screens/home/lovelace/icons.dart';
import 'package:stacked/stacked.dart';
import 'package:collection/collection.dart';

class BaseCard extends StackedView<BaseCardModel> {
  VoidCallback? onTap;
  VoidCallback? onLongPress;
  LovelaceCard? card;
  IconData? icon;
  Color? onColor;
  bool isOn;
  bool center;
  Widget? title;
  Widget? subtitle;

  Color? offColor;
  double? iconProgress;
  Widget? child;

  BaseCard({
    super.key,
    this.onTap,
    this.onLongPress,
    this.card,
    this.center = false,
    this.isOn = false,
    this.onColor,
    this.child,
    this.offColor,
    this.title,
    this.subtitle,
    this.icon,
    this.iconProgress,
  });

  @override
  BaseCardModel viewModelBuilder(BuildContext context) {
    return BaseCardModel();
  }

  @override
  Widget builder(BuildContext context, BaseCardModel viewModel, Widget? _) {
    onColor ??= Colors.yellow.shade800;
    offColor ??= Colors.grey.shade400;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: cardColor(context),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor(context),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Column(
          children: [
            Container(
                //decoration: BoxDecoration(color: cardColorSecondary(context)),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: child == null || center
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        if (icon != null || card != null)
                          CircleAvatar(
                            backgroundColor: isOn
                                ? onColor?.withAlpha(50)
                                : offColor?.withAlpha(50),
                            radius: 18,
                            foregroundColor: isOn ? onColor : offColor,
                            child: Icon(
                              icon ??
                                  (card != null
                                      ? viewModel.getDefaultIcon(card!)
                                      : null),
                              size: 18,
                            ),
                          ),
                        if (iconProgress != null)
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 2 * 18,
                              height: 2 * 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: onColor,
                                backgroundColor: onColor?.withAlpha(100),
                                value: iconProgress ?? 0.0,
                              ),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                                color: textColor(context)),
                            overflow: TextOverflow.ellipsis,
                            child: title!,
                          ),
                        if (subtitle != null)
                          DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 12,
                              color: mutedColor(context),
                              height: 1.2,
                            ),
                            child: subtitle!,
                          ),
                      ],
                    )),
                  ],
                )),
            if (child != null)
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 8.0, top: 4.0),
                child: child!,
              ),
          ],
        ),
      ),
    );
  }
}

class BaseCardModel extends BaseViewModel {
  final _hassService = locator<HassService>();

  IconData? getDefaultIcon(LovelaceCard card) {
    return getIcon(card.icon ?? "",
        entity: card.entity != null ? getEntityById(card.entity!) : null);
  }

  Entity? getEntityById(String entityId) {
    return _hassService.entities
        .firstWhereOrNull((element) => element.entityId == entityId);
  }
}
