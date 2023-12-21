import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_portal/app/app.locator.dart';
import 'package:home_portal/services/hass/hass_service.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/button.dart';
import 'package:stacked/stacked.dart';

class VacuumCard extends StackedView<VacuumModel> {
  final LovelaceCard card;

  const VacuumCard(this.card, {super.key});

  @override
  Widget builder(BuildContext context, VacuumModel viewModel, Widget? child) {
    final camera = card.mapSource?.camera;

    if (camera == null) {
      return const SizedBox();
    }

    final entity = viewModel.getEntityAttributes(camera);

    viewModel.calculateOffsetAndScale(entity);

    final width = entity["image"]["width"];
    final height = entity["image"]["height"];
    final widgetWidth = MediaQuery.of(context).size.width;

    final zoomFactor = (widgetWidth / width) * 0.5;

    bool shouldRotate = height > width;

    final route =
        viewModel.calculateCleaningRoute().map((e) => e * zoomFactor).toList();

    print(route.length);

    return BaseCard(
      child: Column(
        children: [
          Center(
            child: RotatedBox(
              quarterTurns: shouldRotate ? 1 : 0,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Image.network(
                      viewModel.cameraImage(camera),
                      width: width.toDouble() * zoomFactor,
                      height: height.toDouble() * zoomFactor,
                      fit: BoxFit.contain,
                    ),
                  ),
                  if (route.isNotEmpty)
                    SizedBox(
                      width: width.toDouble(),
                      height: height.toDouble(),
                      child: Animate().custom(
                          duration: 3.seconds,
                          curve: Curves.easeInOut,
                          begin: 0,
                          end: 1,
                          builder: (_, value, __) => CustomPaint(
                                painter: VaccuumPainter(route.sublist(
                                    0, (value * route.length).toInt())),
                              )),
                    ),
                  SizedBox(
                    width: width.toDouble() * zoomFactor,
                    height: height.toDouble() * zoomFactor,
                    child: Stack(children: [
                      for (final room in viewModel.calculateRooms(entity))
                        Positioned(
                          left: room.rect.left * zoomFactor,
                          top: room.rect.top * zoomFactor,
                          child: GestureDetector(
                            onTap: () {
                              viewModel.toggleSegment(room.name);
                            },
                            child: Container(
                              width: (room.rect.width).abs() * zoomFactor,
                              height: (room.rect.height).abs() * zoomFactor,
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(viewModel
                                        .selectedSegments
                                        .contains(room.name)
                                    ? 0.5
                                    : 0),
                                border: Border.all(
                                  color: Colors.blue.withOpacity(0.5),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Wrap(spacing: 8, runSpacing: 8, children: [
            CardButton(
              label: "Clean selected rooms",
              onTap: viewModel.startSegmentCleaning,
            ),
            const CardButton(
              label: "Start cleaning",
            ),
          ])
        ],
      ),
    );
  }

  @override
  VacuumModel viewModelBuilder(BuildContext context) {
    return VacuumModel(card);
  }
}

class _Room {
  final String name;
  final Rect rect;

  _Room(this.name, this.rect);
}

class VaccuumPainter extends CustomPainter {
  final List<Offset> points;

  VaccuumPainter(
    this.points,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    //  print(attributes["path"]["path"]);

    final path = Path();

    path.moveTo(points.first.dx, points.first.dy);

    for (var point in points) {
      path.lineTo(point.dx, point.dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant VaccuumPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

class VacuumModel extends ReactiveViewModel {
  Set<String> selectedSegments = {};

  final LovelaceCard card;

  VacuumModel(this.card);

  void toggleSegment(String segment) {
    if (selectedSegments.contains(segment)) {
      selectedSegments.remove(segment);
    } else {
      selectedSegments.add(segment);
    }
    notifyListeners();
  }

  void startSegmentCleaning() {
    print(selectedSegments.toList());
    _hassService.callService("roborock", "vacuum_clean_segment", {
      "segments": selectedSegments.toList(),
      "repeats": 1,
    }, {
      "entity_id": card.entity,
    });
  }

  final _hassService = locator<HassService>();

  Map<String, dynamic> getEntityAttributes(String? entityId) {
    var state = _hassService.state[entityId];
    if (state == null) {
      return {};
    }
    return state.attributes;
  }

  String cameraImage(String entityId) {
    return _hassService.cameraImage(entityId);
  }

  double scaleX = 1.0;

  double scaleY = 1.0;

  double translateX = 0.0;
  double translateY = 0.0;

  void calculateOffsetAndScale(Map<String, dynamic> attributes) {
    final calibrationPoints = attributes["calibration_points"];

    final pointMap1X = calibrationPoints[0]["vacuum"]["x"].toDouble();
    final pointMap1Y = calibrationPoints[0]["vacuum"]["y"].toDouble();
    final pointImage1X = calibrationPoints[0]["map"]["x"].toDouble();
    final pointImage1Y = calibrationPoints[0]["map"]["y"].toDouble();

    final pointMap2X = calibrationPoints[1]["vacuum"]["x"].toDouble();
    final pointMap2Y = calibrationPoints[1]["vacuum"]["y"].toDouble();
    final pointImage2X = calibrationPoints[1]["map"]["x"].toDouble();
    final pointImage2Y = calibrationPoints[1]["map"]["y"].toDouble();

    final pointMap3Y = calibrationPoints[2]["vacuum"]["y"].toDouble();

    final pointImage3Y = calibrationPoints[2]["map"]["y"].toDouble();

    // Calculate transform matrix

    scaleX = (pointMap2X - pointMap1X) / (pointImage2X - pointImage1X);
    scaleY = (pointMap2Y - pointMap3Y) / (pointImage2Y - pointImage3Y);

    translateX = pointMap1X - (pointImage1X * scaleX);
    translateY = pointMap1Y - (pointImage1Y * scaleY);
  }

  double rescaleX(double x) {
    return x / scaleX - translateX / scaleX;
  }

  double rescaleY(double y) {
    return y / scaleY - translateY / scaleY;
  }

  Offset rescaleOffset(Offset offset) {
    return Offset(
      rescaleX(offset.dx),
      rescaleY(offset.dy),
    );
  }

  Map<String, dynamic> get attributes => getEntityAttributes(
        card.mapSource!.camera,
      );

  List<Offset> calculateCleaningRoute() {
    List<Offset> points = [];

    for (var point in attributes["path"]["path"].first) {
      final toAdd = Offset(point["x"].toDouble(), point["y"].toDouble());
      points.add(toAdd);
    }

    points = points.map((point) => rescaleOffset(point)).toList();

    return points;
  }

  List<_Room> calculateRooms(Map<String, dynamic> attributes) {
    final rooms = attributes["rooms"];

    final List<_Room> roomItems = [];

    for (final room in rooms.entries) {
      final x0 = rescaleX(room.value["x0"].toDouble());
      final y0 = rescaleY(room.value["y0"].toDouble());
      final x1 = rescaleX(room.value["x1"].toDouble());
      final y1 = rescaleY(room.value["y1"].toDouble());

      final left = x0 < x1 ? x0 : x1;
      final top = y0 < y1 ? y0 : y1;

      final width = (x0 - x1).abs();
      final height = (y0 - y1).abs();

      roomItems.add(
        _Room(
          room.key,
          Rect.fromLTWH(
            left,
            top,
            width,
            height,
          ),
        ),
      );
    }

    return roomItems;
  }
}
