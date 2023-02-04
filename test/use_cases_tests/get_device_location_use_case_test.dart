import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_demo/data_layer/exceptions/location_exception.dart';
import 'package:weather_app_demo/domain_layer/use_cases/get_device_location_use_case.dart';
import 'package:weather_app_demo/presentation_layer/cubits/base/base_state.dart';

class MockLocation extends Mock implements Location {}

late MockLocation _location;
late GetDeviceLocationUseCase _getDeviceLocationUseCase;

final _currentLocation = LocationData.fromMap({
  'longitude': 1.0,
  'latitude': 2.0,
});

final _invalidLocation = LocationData.fromMap({
  'longitude': null,
  'latitude': 2.0,
});

void main() {
  setUp(() {
    _location = MockLocation();
    _getDeviceLocationUseCase = GetDeviceLocationUseCase(
      location: _location,
    );

    when(
      () => _location.serviceEnabled(),
    ).thenAnswer((invocation) async => true);

    when(
      () => _location.hasPermission(),
    ).thenAnswer((invocation) async => PermissionStatus.granted);

    when(
      () => _location.getLocation(),
    ).thenAnswer((invocation) async => _currentLocation);
  });

  test("Should return current location", () async {
    final _result = await _getDeviceLocationUseCase();

    expect(_result.longitude, 1);
    expect(_result.latittude, 2);

    verify(() => _location.serviceEnabled()).called(1);
    verify(() => _location.hasPermission()).called(1);
    verify(() => _location.getLocation()).called(1);
  });

  test("Should ask to enable location service", () async {
    when(
      () => _location.serviceEnabled(),
    ).thenAnswer((invocation) async => false);

    when(
      () => _location.requestService(),
    ).thenAnswer((invocation) async => true);

    final _result = await _getDeviceLocationUseCase();

    expect(_result.longitude, 1);
    expect(_result.latittude, 2);

    verify(() => _location.serviceEnabled()).called(1);
    verify(() => _location.requestService()).called(1);
    verify(() => _location.hasPermission()).called(1);
    verify(() => _location.getLocation()).called(1);
  });

  test("Should fail if location service is disabled", () async {
    when(
      () => _location.serviceEnabled(),
    ).thenAnswer((invocation) async => false);

    when(
      () => _location.requestService(),
    ).thenAnswer((invocation) async => false);

    expect(
      () async => _getDeviceLocationUseCase(),
      throwsA(
        predicate(
          (p0) =>
              p0 is LocationException &&
              p0.error == CubitErrorCode.locationServiceDisabled,
        ),
      ),
    );
  });

  test("Should ask for permission if denied", () async {
    when(
      () => _location.hasPermission(),
    ).thenAnswer((invocation) async => PermissionStatus.denied);

    when(
      () => _location.requestPermission(),
    ).thenAnswer((invocation) async => PermissionStatus.granted);

    final _result = await _getDeviceLocationUseCase();

    expect(_result.longitude, 1);
    expect(_result.latittude, 2);

    verify(() => _location.serviceEnabled()).called(1);
    verify(() => _location.hasPermission()).called(1);
    verify(() => _location.requestPermission()).called(1);
    verify(() => _location.getLocation()).called(1);
  });

  test("Should fail if location permission is not granted", () async {
    when(
      () => _location.hasPermission(),
    ).thenAnswer((invocation) async => PermissionStatus.denied);

    when(
      () => _location.requestPermission(),
    ).thenAnswer((invocation) async => PermissionStatus.denied);

    expect(
      () async => _getDeviceLocationUseCase(),
      throwsA(
        predicate(
          (p0) =>
              p0 is LocationException &&
              p0.error == CubitErrorCode.locationPermissionDenied,
        ),
      ),
    );
  });

  test("Should fail if returned location is invalid", () async {
    when(
      () => _location.getLocation(),
    ).thenAnswer((invocation) async => _invalidLocation);
    expect(
      () async => _getDeviceLocationUseCase(),
      throwsA(
        predicate(
          (p0) =>
              p0 is LocationException &&
              p0.error == CubitErrorCode.locationServiceError,
        ),
      ),
    );
  });
}
