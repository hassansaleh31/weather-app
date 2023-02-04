import 'package:location/location.dart';

import '../../data_layer/exceptions/location_exception.dart';
import '../../presentation_layer/cubits/base/base_state.dart';
import '../models/coordinates.dart';

/// Use case for getting the current device location.
class GetDeviceLocationUseCase {
  final Location _location;

  ///Creates a new [GetDeviceLocationUseCase].
  GetDeviceLocationUseCase({
    required Location location,
  }) : _location = location;

  /// Returns the current device location
  Future<Coordinates> call() async {
    var isEnabled = await _location.serviceEnabled();

    if (!isEnabled) {
      isEnabled = await _location.requestService();
    }

    if (!isEnabled) {
      throw LocationException(
        error: CubitErrorCode.locationServiceDisabled,
        message: 'Failed to get your current location, make sure'
            ' the location service on your device is enabled',
      );
    }

    var status = await _location.hasPermission();

    if (status == PermissionStatus.denied) {
      status = await _location.requestPermission();
    }

    if (status == PermissionStatus.denied ||
        status == PermissionStatus.deniedForever) {
      throw LocationException(
        error: CubitErrorCode.locationPermissionDenied,
        message: 'Failed to get your current location, make sure'
            ' the app has permission to request the device location.',
      );
    }

    final locationData = await _location.getLocation().timeout(Duration(
          seconds: 5,
        ));

    if (locationData.longitude == null || locationData.latitude == null) {
      throw LocationException(
        error: CubitErrorCode.locationServiceError,
        message: 'Failed to get your current location',
      );
    }
    return Coordinates(
      longitude: locationData.longitude!,
      latittude: locationData.latitude!,
    );
  }
}
