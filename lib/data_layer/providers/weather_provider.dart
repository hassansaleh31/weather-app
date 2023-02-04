import '../../data_layer/dtos/current_weather_dto.dart';
import '../../domain_layer/models/coordinates.dart';
import '../networking/net_client.dart';
import '../networking/net_endpoints.dart';
import '../networking/net_request_methods.dart';

/// Provides data about the weather
class WeatherProvider {
  /// The NetClient to use for the network requests
  final NetClient _netClient;

  /// Creates a new [WeatherProvider] with the supplied netClient.
  WeatherProvider({
    required NetClient netClient,
  }) : _netClient = netClient;

  /// Fetches the current weather
  Future<CurrentWeatherDTO> getCurrentWeather({
    required Coordinates coordinates,
    bool forceRefresh = false,
  }) async {
    final response = await _netClient.request(
      NetEndpoints().currentWeather,
      method: NetRequestMethods.get,
      forceRefresh: forceRefresh,
      queryParameters: {
        'lon': coordinates.longitude,
        'lat': coordinates.latittude,
      },
    );

    return CurrentWeatherDTO.fromJson(response.data);
  }
}
