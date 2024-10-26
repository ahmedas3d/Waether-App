import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitialStates extends WeatherStates {}

class WeatherLoadedStates extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedStates(this.weatherModel);
}

class WeatherFailureStates extends WeatherStates {
  final String errorMessage;

  WeatherFailureStates(this.errorMessage);
}
