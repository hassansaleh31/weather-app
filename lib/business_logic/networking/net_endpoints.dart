/// Holds the basic information to access the backend
class NetEndpoints {
  /// Creates [NetEndpoints].
  const NetEndpoints();
  static const String base = 'https://api.openweathermap.org';
  String get currentWeather => '$base/data/2.5/weather';
}
