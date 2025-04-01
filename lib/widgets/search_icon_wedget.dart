import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_v1/cubits/get_wether_cubit/get_weather_cubit.dart';
import 'package:wether_app_v1/models/weather_model.dart';
import 'package:wether_app_v1/services/weather_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchIcon extends StatefulWidget {
  const SearchIcon({
    super.key,
  });

  @override
  State<SearchIcon> createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
  String selectedLanguage = "en";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Text("Filter condition by language ",
                    style: TextStyle(fontSize: 15.sp)),
                SizedBox(width: 10.w),
                DropdownButton<String>(
                  iconSize: 40.sp,
                  menuWidth: 100.w,
                  value: selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  items: <String>[
                    'ar',
                    'en',
                    'bn',
                    'bg',
                    'zh',
                    'zh_tw',
                    'cs',
                    'da',
                    'nl',
                    'fi',
                    'fr',
                    'de',
                    'ko',
                    'zh_cmn',
                    'mr',
                    'pl',
                    'si',
                    'sk',
                    'es',
                    'sv',
                    'ta',
                    'te',
                    'tr',
                    'uk',
                    'ur',
                    'vi',
                    'zh_wuu',
                    'zh_hsn',
                    'zh_yue',
                    'zu'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextField(
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getweather(
                    cityName: value, lang: selectedLanguage);
                // weatherModel = await WeatherService(dio: Dio())
                //     .getCurrentWeather(cityName: value);

                // Navigator.of(context).pop();
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  // borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
                contentPadding: EdgeInsets.all(20.w), //
                labelText: "Search",
                //suffixIconColor: Colors.purple,
                suffixIcon: const Icon(Icons.search),
                hintText: "Enter City Name",
                //  hintStyle: const TextStyle(color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  //  borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
