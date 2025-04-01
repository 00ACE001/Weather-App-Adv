import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wether_app_v1/cubits/get_wether_cubit/get_weather_cubit.dart';
import 'package:wether_app_v1/cubits/get_wether_cubit/get_wether_state.dart';
import 'package:wether_app_v1/firebase_options.dart';
import 'package:wether_app_v1/views/home_view.dart';
import 'package:wether_app_v1/views/login_page.dart';
import 'package:wether_app_v1/views/regester_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(360, 800),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  routes: {
                    LoginPage.id: (context) => LoginPage(),
                    RegesterPage.id: (context) => RegesterPage(),
                    HomeView.id: (context) => HomeView(),
                  },
                  theme: ThemeData(
                    primarySwatch: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.weatherCondition),
                    useMaterial3: false,
                    //  brightness: Brightness.dark,
                  ),
                  debugShowCheckedModeBanner: false,
                  initialRoute: LoginPage.id,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    // Sunny and clear conditions
    case "Sunny":
    case "Clear":
      return Colors.orange;

    // Cloudy and overcast conditions
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
      return Colors.blueGrey;

    // Mist, fog, and freezing fog
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.grey;

    // Rain-related conditions
    case "Patchy rain possible":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
      return Colors.blue;

    // Snow-related conditions
    case "Patchy snow possible":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
      return Colors.lightBlue;

    // Sleet and freezing rain conditions
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.cyan;

    // Thunderstorm-related conditions
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;

    // Blizzard and blowing snow
    case "Blowing snow":
    case "Blizzard":
      return Colors.indigo;

    // Ice pellets
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.teal;

    // Default color for unknown conditions
    default:
      return Colors.blue;
  }
}
