import 'package:dartz/dartz.dart';
import 'package:flutter_weather/constants/const.dart';
import 'package:flutter_weather/model/weather.dart';
import 'package:flutter_weather/utils/failure.dart';
import 'package:weatherapi/weatherapi.dart';

class WeatherHandler {
  static Future<Either<Failure, WeatherModel>> getData() async {
    final wethReq = WeatherRequest(
      WEATHER_API_KEY,
      language: Language.russian,
    );

    const double latitude = 54.983334;
    const double longitude = 73.366669;

    try {
      RealtimeWeather rw =
          await wethReq.getRealtimeWeatherByLocation(latitude, longitude);

      final current = Current(
          last_updated: rw.current.lastUpdated,
          temp_c: rw.current.tempC,
          windKph: rw.current.windKph,
          condition: Condition(
            text: rw.current.condition.text,
            icon: rw.current.condition.icon,
          ));
      final location = Location(
        name: rw.location.name,
        country: rw.location.country,
        localtime: rw.location.localtime,
        region: rw.location.region,
      );
      return Right(
        WeatherModel(current: current, location: location),
      );
    } catch (e) {
      return Left(Failure(message: 'Something went wrong'));
    }
  }
}
