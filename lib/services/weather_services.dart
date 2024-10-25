import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'db5e021cddd742e1b7e112546242210';

  WeatherServices({required this.dio});
  Future<WeatherModel> getCurrentWeather(
      {required String cityName, required BuildContext context}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&day=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error, please try again';
      throw Exception(errorMessage);
    } catch (e) {
      print(e.toString());
      throw Exception('Oops there was an error, please try again');
    }
  }
}

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     backgroundColor: Colors.red,
      //     duration: Duration(seconds: 2),
      //     behavior: SnackBarBehavior.floating,
      //     content: Text('Something went wrong!'),
      //   ),
      // );