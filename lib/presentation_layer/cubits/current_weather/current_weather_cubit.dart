import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data_layer/exceptions/location_exception.dart';
import '../../../domain_layer/models/coordinates.dart';
import '../../../domain_layer/use_cases/get_current_weather_use_case.dart';
import '../../../domain_layer/use_cases/get_device_location_use_case.dart';
import '../base/base_state.dart';
import 'current_weather_state.dart';

/// Cubit responsible for retrieving [CurrentWeather] in the user's location
class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  final GetDeviceLocationUseCase _getDeviceLocationUseCase;

  /// Creates a new instance of [CurrentWeatherCubit]
  CurrentWeatherCubit({
    required GetCurrentWeatherUseCase getCurrentWeatherUseCase,
    required GetDeviceLocationUseCase getDeviceLocationUseCase,
  })  : _getCurrentWeatherUseCase = getCurrentWeatherUseCase,
        _getDeviceLocationUseCase = getDeviceLocationUseCase,
        super(CurrentWeatherState());

  /// Loads the weather conditions for the current location and time
  void load() async {
    late Coordinates coordinates;
    try {
      emit(
        state.copyWith(
          actions: state.addAction(
            CurrentWeatherActions.gettingUserLocation,
          ),
          errors: <CubitError>{},
        ),
      );
      coordinates = await _getDeviceLocationUseCase();
    } on LocationException catch (e) {
      emit(
        state.copyWith(
          actions: state.removeAction(
            CurrentWeatherActions.gettingUserLocation,
          ),
          errors: state.addCustomCubitError(
            action: CurrentWeatherActions.gettingUserLocation,
            code: e.error,
            message: e.message,
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
          longitude: coordinates.longitude,
          latittude: coordinates.latittude,
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
