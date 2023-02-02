import '../dtos/clouds_dto.dart';
import '../models/clouds.dart';

/// Extension that provides mappings for [CloudsDTO]
extension CloudsDTOMapping on CloudsDTO {
  /// Maps into a [Clouds]
  Clouds toClouds() {
    return Clouds(
      all: all ?? 0,
    );
  }
}
