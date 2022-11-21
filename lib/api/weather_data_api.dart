import '/constants/urls.dart';
import '/models/weather_info.dart';
import '/utils/dio_client.dart';
import '/utils/request_type.dart';

class WeatherDataApi {
  Future<double> fetchWeatherInfo(double latitude, double longitude) async {
    try {
      final url = ApiEndpoints.weatherUrl
          .replaceAll("latitude", latitude.toString())
          .replaceAll("longitude", longitude.toString());

      final res =
          await DioClient().request(requestType: RequestType.get, url: url);

      return WeatherInfo.fromJson(res.data).temperature;
    } catch (ex) {
      return 0;
    }
  }
}
