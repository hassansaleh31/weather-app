import '../../data_layer/dtos/snow_dto.dart';
import '../../domain_layer/models/snow.dart';

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
