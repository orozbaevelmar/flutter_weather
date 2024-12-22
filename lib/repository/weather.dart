import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_weather/constants/const.dart';
import 'package:flutter_weather/model/weather.dart';
import 'package:flutter_weather/utils/failure.dart';
import 'package:http/http.dart' as http;

class WeathersRepository {
  static Future<Either<Failure, WeatherModel>> getData() async {
    final double latitude = 54.983334;
    final double longtitude = 73.366669;
    try {
      final queryParams = {
        'key': WEATHER_API_KEY,
        'q': '$latitude,$longtitude',
        'lang': 'ru',
      };
      print('1');
      var uri = Uri.parse('$BASE_URL/current.json').replace(
        queryParameters: queryParams,
      );
      print('2');

      final response = await http.get(uri).timeout(const Duration(seconds: 10));
      print('3');
      print(response.statusCode);
      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        return Right(WeatherModel.fromJson(responseBody));
      } else {
        return Left(Failure(message: 'Failed to parse json response'));
      }
    } catch (e) {
      return Left(Failure(message: 'Something went wrong'));
    }
  }
}
