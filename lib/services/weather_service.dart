import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wether_app_v1/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseurl = "https://api.weatherapi.com/v1";
  final String apikey = "8f5abf5b9c594be3824175013241012";
  //https://api.weatherapi.com/v1/forecast.json?key=8f5abf5b9c594be3824175013241012&q=cairo&days=1
  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather(
      {required String cityName, required String lang}) async {
    try {
      Response response = await Dio().get(
          "$baseurl/forecast.json?key=$apikey&q=$cityName&days=1&lang=$lang");

      WeatherModel weatherModel = WeatherModel.fromJSON(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops, there was an error, please try again later.";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops, there was an error, please try again later");
    }
  }
}
