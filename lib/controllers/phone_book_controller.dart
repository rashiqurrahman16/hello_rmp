import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../backend/api_enpoind.dart';
import '../backend/model/phone_book_model.dart';

class PhoneBookController extends GetxController {
  final String apiUrl = "${ApiEndpoint.baseUrl}/get-phonebook";

  var phoneBookList = <Datum>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint('working phone number');
        isLoading.value = false;
        final parsedResponse = json.decode(response.body);

        // Parse the response into PhoneBookModel
        final phoneBookModel =
            phoneBookModelFromJson(json.encode(parsedResponse));

        phoneBookList.value = phoneBookModel.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
