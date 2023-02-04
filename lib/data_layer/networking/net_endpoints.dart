/// Holds the basic information to access the backend
class NetEndpoints {
  /// Creates [NetEndpoints].
  const NetEndpoints();

  /// The base url for the weather api
  static const String base = 'https://api.openweathermap.org';

  /// The current weather endpoint
  String get currentWeather => '$base/data/2.5/weather';
}
