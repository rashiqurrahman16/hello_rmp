import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../backend/api_enpoind.dart';
import '../backend/model/app_banner_model.dart';
import '../backend/model/app_slider_model.dart';
import '../backend/model/weather_api_model.dart';

class HomeController extends GetxController {
  var appBanner = AppBannerModel(status: 0, message: "", data: "").obs;

  var sliders = <AppSliderModel>[].obs;
  Rx<WeatherApiGetModel?> weatherData = Rx<WeatherApiGetModel?>(null);

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiEndpoint.baseUrl}/get-app-banner"),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        appBanner.value = AppBannerModel.fromJson(jsonData);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  Future<void> fetchSliderData() async {
    try {
      final response = await http.get(
        Uri.parse("${ApiEndpoint.baseUrl}/get-app-slider"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<AppSliderModel> sliderList =
            jsonData.map((item) => AppSliderModel.fromJson(item)).toList();
        sliders.assignAll(sliderList);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  @override
  void onInit() {
    fetchData();
    fetchSliderData();
    // fetchWeatherData(
    //     'Khulna'); // Call fetchData when the controller is initialized.
    super.onInit();
  }

  final String phoneNumber = "999";

  void launchDialer(String phoneNumber) async {
    await launchUrl(Uri.parse('tel:$phoneNumber'));
  }

// Future<void> fetchWeatherData(String cityName) async {
//   const apiKey =
//       '3265874a2c77ae4a04bb96236a642d2f'; // Replace with your OpenWeatherMap API key
//   final url =
//       'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
//
//   try {
//     final response = await http.get(Uri.parse(url)); // Use http.get
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data =
//           json.decode(response.body); // Decode the response body
//       final weatherDataModel = WeatherApiGetModel.fromJson(data);
//       weatherData.value = weatherDataModel;
//     } else {
//       // Handle API error here
//       print('API Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Handle network error here
//     print('Network Error: $e');
//   }
// }
}
