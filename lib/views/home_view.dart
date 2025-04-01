import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app_v1/cubits/get_wether_cubit/get_weather_cubit.dart';
import 'package:wether_app_v1/cubits/get_wether_cubit/get_wether_state.dart';
import 'package:wether_app_v1/views/search_page.dart';
import 'package:wether_app_v1/widgets/error_wedget.dart';
import 'package:wether_app_v1/widgets/no_weather_body.dart';
import 'package:wether_app_v1/widgets/search_icon_wedget.dart';
import 'package:wether_app_v1/widgets/weather_info_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  static String id = "homeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
              text: 'Weather',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'App',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 246, 223, 20),
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else if (state is WeatherFailedState) {
            return ErrorWedget(
              errorMessage: state.errorMessage,
            );
          } else {
            return const Text("opps somthing is wrong");
          }
        },
      ),
    );
  }
}
