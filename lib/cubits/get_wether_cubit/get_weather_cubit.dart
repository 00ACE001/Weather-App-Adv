import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_v1/cubits/get_wether_cubit/get_wether_state.dart';
import 'package:wether_app_v1/models/weather_model.dart';
import 'package:wether_app_v1/services/weather_service.dart';
import 'package:wether_app_v1/widgets/search_icon_wedget.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  getweather({required String cityName, required String lang}) async {
    try {
      weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName, lang: lang);
      emit(
        WeatherLoadedState(weatherModel: weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFailedState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
