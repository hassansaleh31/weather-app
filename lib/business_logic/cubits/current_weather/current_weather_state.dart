import '../../dto_mappings/current_weather_dto_mapping.dart';
import '../../dtos/current_weather_dto.dart';
import '../../models/current_weather.dart';
import '../base/base_state.dart';

/// The available busy actions that the cubit can perform.
enum CurrentWeatherActions {
  /// Fetching the current weather conditions
  fetchingConditions,

  /// Getting the user longitude and latidude
  gettingUserLocation,
}

/// The state for the [CurrentWeatherCubit].
class CurrentWeatherState extends BaseState<CurrentWeatherActions, void> {
  /// The current weather conditions
  final CurrentWeather currentWeather;

  /// Creates a new [CurrentWeatherState].
  CurrentWeatherState({
    super.actions = const <CurrentWeatherActions>{},
    super.errors = const <CubitError>{},
    CurrentWeather? currentWeather,
  }) : currentWeather =
            currentWeather ?? CurrentWeatherDTO().toCurrentWeather();

  @override
  CurrentWeatherState copyWith({
    Set<CurrentWeatherActions>? actions,
    Set<CubitError>? errors,
    CurrentWeather? currentWeather,
  }) {
    return CurrentWeatherState(
      actions: actions ?? this.actions,
      errors: errors ?? this.errors,
      currentWeather: currentWeather ?? this.currentWeather,
    );
  }

  @override
  List<Object?> get props => [
        errors,
        actions,
        events,
        currentWeather,
      ];
}
