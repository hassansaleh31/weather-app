import '../networking/json_parser.dart';

/// A data structure object representing the rain conditions
class RainDTO {
  /// Rain volume for the last 1 hour, mm
  final double? oneHour;

  /// Rain volume for the last 3 hours, mm
  final double? threeHour;

  /// Creates a new [RainDTO].
  RainDTO({
    this.oneHour,
    this.threeHour,
  });

  /// Creates a [RainDTO] from the supplied JSON object
  factory RainDTO.fromJson(Map<String, dynamic>? json) {
    return RainDTO(
      oneHour: parseDouble(json?['1h']),
      threeHour: parseDouble(json?['3h']),
    );
  }
}
