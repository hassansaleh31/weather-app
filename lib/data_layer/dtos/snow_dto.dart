import '../networking/json_parser.dart';

/// A data structure object representing the snow conditions
class SnowDTO {
  /// Snow volume for the last 1 hour, mm
  final double? oneHour;

  /// Snow volume for the last 3 hours, mm
  final double? threeHour;

  /// Creates a new [SnowDTO].
  SnowDTO({
    this.oneHour,
    this.threeHour,
  });

  /// Creates a [SnowDTO] from the supplied JSON object
  factory SnowDTO.fromJson(Map<String, dynamic>? json) {
    return SnowDTO(
      oneHour: parseDouble(json?['1h']),
      threeHour: parseDouble(json?['3h']),
    );
  }
}
