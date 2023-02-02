import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../models/coordinates.dart';
import '../../use_cases/get_current_weather_use_case.dart';
import '../base/base_state.dart';
import 'current_weather_state.dart';

/// Cubit responsible for retrieving [CurrentWeather] in the user's location
class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  /// Creates a new instance of [CurrentWeatherCubit]
  CurrentWeatherCubit({
    required GetCurrentWeatherUseCase getCurrentWeatherUseCase,
  })  : _getCurrentWeatherUseCase = getCurrentWeatherUseCase,
        super(CurrentWeatherState());

  /// Loads the weather conditions for the current location and time
  void load() async {
    LocationData? locationData;
    try {
      final _location = Location();
      emit(
        state.copyWith(
          actions: state.addAction(
            CurrentWeatherActions.gettingUserLocation,
          ),
          errors: <CubitError>{},
        ),
      );

      var isEnabled = await _location.serviceEnabled();

      if (!isEnabled) {
        isEnabled = await _location.requestService();
      }

      if (!isEnabled) {
        emit(
          state.copyWith(
            actions: state.removeAction(
              CurrentWeatherActions.gettingUserLocation,
            ),
            errors: state.addCustomCubitError(
              action: CurrentWeatherActions.gettingUserLocation,
              code: CubitErrorCode.locationServiceDisabled,
              // Usually this is a localization but I'm short on time :)
              message: 'Failed to get your current location, make sure'
                  ' the location service on your device is enabled',
            ),
          ),
        );

        return;
      }

      var status = await _location.hasPermission();

      if (status == PermissionStatus.denied) {
        status = await _location.requestPermission();
      }

      if (status == PermissionStatus.denied ||
          status == PermissionStatus.deniedForever) {
        emit(
          state.copyWith(
            actions: state.removeAction(
              CurrentWeatherActions.gettingUserLocation,
            ),
            errors: state.addCustomCubitError(
              action: CurrentWeatherActions.gettingUserLocation,
              code: CubitErrorCode.locationServiceDisabled,
              // Usually this is a localization but I'm short on time :)
              message: 'Failed to get your current location, make sure'
                  ' the app has permission to request device location',
            ),
          ),
        );

        return;
      }

      locationData = await _location.getLocation().timeout(Duration(
            seconds: 5,
          ));
      emit(
        state.copyWith(
          actions: state.removeAction(
            CurrentWeatherActions.gettingUserLocation,
          ),
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          actions: state.removeAction(
            CurrentWeatherActions.gettingUserLocation,
          ),
          errors: state.addErrorFromException(
            action: CurrentWeatherActions.gettingUserLocation,
            exception: e,
          ),
        ),
      );
    }

    if (locationData == null) return;
    if (locationData.longitude == null || locationData.latitude == null) {
      emit(
        state.copyWith(
          actions: state.removeAction(
            CurrentWeatherActions.gettingUserLocation,
          ),
          errors: state.addCustomCubitError(
            action: CurrentWeatherActions.gettingUserLocation,
            code: CubitErrorCode.locationServiceError,
            // Usually this is a localization but I'm short on time :)
            message: 'Failed to get your current location',
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        actions: state.addAction(
          CurrentWeatherActions.fetchingConditions,
        ),
        errors: <CubitError>{},
      ),
    );

    try {
      final currentWeather = await _getCurrentWeatherUseCase(
        coordinates: Coordinates(
          longitude: locationData.longitude!,
          latittude: locationData.latitude!,
        ),
      );

      emit(
        state.copyWith(
          currentWeather: currentWeather,
          actions: state.removeAction(
            CurrentWeatherActions.fetchingConditions,
          ),
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          actions: state.removeAction(
            CurrentWeatherActions.fetchingConditions,
          ),
          errors: state.addErrorFromException(
            action: CurrentWeatherActions.fetchingConditions,
            exception: e,
          ),
        ),
      );
    }
  }
}
