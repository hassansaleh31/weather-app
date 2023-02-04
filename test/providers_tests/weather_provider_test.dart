import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_demo/data_layer/networking/net_client.dart';
import 'package:weather_app_demo/data_layer/networking/net_endpoints.dart';
import 'package:weather_app_demo/data_layer/networking/net_request_methods.dart';
import 'package:weather_app_demo/data_layer/networking/net_response.dart';
import 'package:weather_app_demo/data_layer/providers/weather_provider.dart';
import 'package:weather_app_demo/domain_layer/models/coordinates.dart';

class MockNetClient extends Mock implements NetClient {}

late MockNetClient _client;
late WeatherProvider _provider;

void main() {
  setUpAll(() {
    _client = MockNetClient();
    _provider = WeatherProvider(netClient: _client);

    final response = NetResponse(
      data: {
        "coord": {"lon": 10.99, "lat": 44.34},
        "weather": [
          {
            "id": 501,
            "main": "Rain",
            "description": "moderate rain",
            "icon": "10d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 298.48,
          "feels_like": 298.74,
          "temp_min": 297.56,
          "temp_max": 300.05,
          "pressure": 1015,
          "humidity": 64,
          "sea_level": 1015,
          "grnd_level": 933
        },
        "visibility": 10000,
        "wind": {"speed": 0.62, "deg": 349, "gust": 1.18},
        "rain": {"1h": 3.16},
        "clouds": {"all": 100},
        "dt": 1661870592,
        "sys": {
          "type": 2,
          "id": 2075663,
          "country": "IT",
          "sunrise": 1661834187,
          "sunset": 1661882248
        },
        "timezone": 7200,
        "id": 3163858,
        "name": "Zocca",
        "cod": 200
      },
      statusCode: 200,
    );

    when(
      () => _client.request(
        NetEndpoints().currentWeather,
        method: NetRequestMethods.get,
        forceRefresh: false,
        queryParameters: {
          'lon': 10.99,
          'lat': 44.34,
        },
      ),
    ).thenAnswer((invocation) async => response);
  });

  test(
    'Should fetch current weather DTO',
    () async {
      final weather = await _provider.getCurrentWeather(
        coordinates: Coordinates(
          longitude: 10.99,
          latittude: 44.34,
        ),
      );

      expect(weather.clouds?.all, 100);

      expect(weather.coordinates?.lon, 10.99);
      expect(weather.coordinates?.lat, 44.34);

      expect(weather.country, "IT");

      expect(weather.dateTime, 1661870592);

      expect(weather.mainConditions?.temp, 298.48);
      expect(weather.mainConditions?.feelsLike, 298.74);
      expect(weather.mainConditions?.tempMin, 297.56);
      expect(weather.mainConditions?.tempMax, 300.05);
      expect(weather.mainConditions?.pressure, 1015);
      expect(weather.mainConditions?.humidity, 64);
      expect(weather.mainConditions?.seaLevel, 1015);
      expect(weather.mainConditions?.grndLevel, 933);

      expect(weather.rain?.oneHour, 3.16);
      expect(weather.rain?.threeHour, null);

      expect(weather.snow?.oneHour, null);
      expect(weather.snow?.threeHour, null);

      expect(weather.sunrise, 1661834187);
      expect(weather.sunset, 1661882248);
      expect(weather.timezone, 7200);
      expect(weather.visibility, 10000);

      expect(weather.weather?.length, 1);
      expect(weather.weather?[0].id, 501);
      expect(weather.weather?[0].main, "Rain");
      expect(weather.weather?[0].description, "moderate rain");
      expect(weather.weather?[0].icon, "10d");

      expect(weather.wind?.speed, 0.62);
      expect(weather.wind?.deg, 349);
      expect(weather.wind?.gust, 1.18);

      verify(() => _client.request(
            NetEndpoints().currentWeather,
            method: NetRequestMethods.get,
            forceRefresh: false,
            queryParameters: {
              'lon': 10.99,
              'lat': 44.34,
            },
          )).called(1);
    },
  );
}
