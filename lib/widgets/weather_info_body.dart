import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_v1/cubits/get_wether_cubit/get_weather_cubit.dart';
import 'package:wether_app_v1/main.dart';
import 'package:wether_app_v1/models/weather_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
            Text(
              "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}:${weatherModel.date.second}",
              style: TextStyle(
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "http:${weatherModel.image}",
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp: ${weatherModel.maxTemp.toString()}",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "MinTemp: ${weatherModel.minTemp.toString()}",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              weatherModel.weatherCondition.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
