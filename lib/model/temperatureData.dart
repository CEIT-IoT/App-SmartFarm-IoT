import 'package:collection/collection.dart';

class TemperaturePoint {
  final double x;
  final double y;
  TemperaturePoint({required this.x, required this.y});
}

List<TemperaturePoint> get temperaturePoints {
  final data = <double>[1, 2, 3, 4, 3, 6, 4];
  return data
      .mapIndexed(((index, element) =>
          TemperaturePoint(x: index.toDouble(), y: element)))
      .toList();
}
