import '../models/coordinates.dart';
import '../models/current_weather.dart';
import '../repositories/weather_repository.dart';

/// Use case for getting the current weather conditions.
class GetCurrentWeatherUseCase {
  final WeatherRepository _repository;

  /// Creates a new [GetCurrentWeatherUseCase].
  GetCurrentWeatherUseCase({
    required WeatherRepository repository,
  }) : _repository = repository;

  /// Returns the current weather in the provided location
  Future<CurrentWeather> call({
    required Coordinates coordinates,
    bool forceRefresh = false,
  }) {
    return _repository.getCurrentWeather(
      coordinates: coordinates,
      forceRefresh: forceRefresh,
    );
  }
}
