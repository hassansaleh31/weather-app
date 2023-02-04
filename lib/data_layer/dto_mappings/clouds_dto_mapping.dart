import '../../data_layer/dtos/clouds_dto.dart';
import '../../domain_layer/models/clouds.dart';

/// Extension that provides mappings for [CloudsDTO]
extension CloudsDTOMapping on CloudsDTO {
  /// Maps into a [Clouds]
  Clouds toClouds() {
    return Clouds(
      all: all ?? 0,
    );
  }
}
