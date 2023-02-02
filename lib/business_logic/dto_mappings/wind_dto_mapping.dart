import '../dtos/wind_dto.dart';
import '../models/wind.dart';

/// Extension that provides mappings for [WindDTO]
extension WindDTOMapping on WindDTO {
  /// Maps into a [Wind]
  Wind toWind() {
    return Wind(
      speed: speed ?? 0,
      deg: deg ?? 0,
      gust: gust ?? 0,
    );
  }
}
