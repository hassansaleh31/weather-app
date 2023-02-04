import '../networking/json_parser.dart';

/// A data structure object representing the wind conditions
class WindDTO {
  /// Wind speed. Unit Default: meter/sec, Metric: meter/sec,
  /// Imperial: miles/hour.
  final double? speed;

  /// Wind direction, degrees (meteorological)
  final double? deg;

  /// Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  final double? gust;

  /// Creates a new [WindDTO].
  WindDTO({
    this.speed,
    this.deg,
    this.gust,
  });

  /// Creates a [WindDTO] from the supplied JSON object
  factory WindDTO.fromJson(Map<String, dynamic>? json) {
    return WindDTO(
      speed: parseDouble(json?['speed']),
      deg: parseDouble(json?['deg']),
      gust: parseDouble(json?['gust']),
    );
  }
}
