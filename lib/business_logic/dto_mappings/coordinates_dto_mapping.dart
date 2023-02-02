import '../dtos/coordinates_dto.dart';
import '../models/coordinates.dart';

/// Extension that provides mappings for [CoordinatesDTO]
extension CoordinatesDTOMapping on CoordinatesDTO {
  /// Maps into a [Coordinates]
  Coordinates toCoordinates() {
    return Coordinates(
      longitude: lon ?? 0,
      latittude: lat ?? 0,
    );
  }
}
