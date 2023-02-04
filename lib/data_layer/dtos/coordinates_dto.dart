import '../networking/json_parser.dart';

/// A data structure object representing coordinates
class CoordinatesDTO {
  /// City geo location, longitude
  final double? lon;

  /// City geo location, latitude
  final double? lat;

  /// Creates a new [CoordinatesDTO].
  CoordinatesDTO({
    this.lon,
    this.lat,
  });

  /// Creates a [CoordinatesDTO] from the supplied JSON object
  factory CoordinatesDTO.fromJson(Map<String, dynamic>? json) {
    return CoordinatesDTO(
      lon: parseDouble(json?['lon']),
      lat: parseDouble(json?['lat']),
    );
  }
}
