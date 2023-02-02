import 'package:equatable/equatable.dart';

/// The coordinates of the location
class Coordinates extends Equatable {
  /// City geo location, longitude
  final double longitude;

  /// City geo location, latitude
  final double latittude;

  /// Creates a new [Coordinates] Instance
  Coordinates({
    required this.longitude,
    required this.latittude,
  });

  @override
  List<Object?> get props => [
        longitude,
        latittude,
      ];

  /// Returns a copy of the coordinates data modified by the provided data.
  Coordinates copyWith(
    double? longitude,
    double? latittude,
  ) {
    return Coordinates(
      longitude: longitude ?? this.longitude,
      latittude: latittude ?? this.latittude,
    );
  }
}
