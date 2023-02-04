import '../../presentation_layer/cubits/base/base_state.dart';

/// Exception thrown when failing to get the device location
class LocationException implements Exception {
  /// The error that caused the location exception
  final CubitErrorCode error;

  /// The error message
  final String? message;

  /// Creates a new [LocationException]
  LocationException({
    required this.error,
    this.message,
  });
}
