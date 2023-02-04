import 'package:equatable/equatable.dart';

/// The wind conditions
class Wind extends Equatable {
  /// Wind speed. Unit Default: meter/sec, Metric: meter/sec,
  /// Imperial: miles/hour.
  final double speed;

  /// Wind direction, degrees (meteorological)
  final double deg;

  /// Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final double gust;

  /// Creates a new [Wind] Instance
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];

  /// Returns a copy of the wind data modified by the provided data.
  Wind copyWith(
    double? speed,
    double? deg,
    double? gust,
  ) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }
}
