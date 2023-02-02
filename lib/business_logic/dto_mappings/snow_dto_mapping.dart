import '../dtos/snow_dto.dart';
import '../models/snow.dart';

/// Extension that provides mappings for [SnowDTO]
extension SnowDTOMapping on SnowDTO {
  /// Maps into a [Snow]
  Snow toSnow() {
    return Snow(
      oneHour: oneHour ?? 0,
      threeHour: threeHour ?? 0,
    );
  }
}
