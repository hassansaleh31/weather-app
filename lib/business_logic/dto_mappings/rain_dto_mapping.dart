import '../dtos/rain_dto.dart';
import '../models/rain.dart';

/// Extension that provides mappings for [RainDTO]
extension RainDTOMapping on RainDTO {
  /// Maps into a [Rain]
  Rain toRain() {
    return Rain(
      oneHour: oneHour ?? 0,
      threeHour: threeHour ?? 0,
    );
  }
}
