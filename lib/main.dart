import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
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
    // Clear or Sunny conditions
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    // Cloudy conditions
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    // Fog and Mist conditions
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    // Rain conditions
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;
    // Drizzle conditions
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.lightBlue;
    // Snow conditions
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.lightBlue;
    // Sleet conditions
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.blueGrey;
    // Thunderstorm conditions
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    // Specific weather events
    case 'Blowing snow':
      return Colors.lightBlue;
    case 'Blizzard':
      return Colors.indigo;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.teal;
    // Showers
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
      return Colors.green;
    case 'Torrential rain shower':
      return Colors.red;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;
    // Default case for unknown conditions
    default:
      return Colors.blue;
  }
}
