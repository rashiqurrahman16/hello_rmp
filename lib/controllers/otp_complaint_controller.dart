import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../backend/api_enpoind.dart';
import '../backend/model/otp_input_model.dart';
import '../routes/routes.dart';

class OtpComplaintController extends GetxController {
  final otpController = TextEditingController();

  Future<OtpInputModel> postOtp() async {
    final response = await http.post(
      Uri.parse('${ApiEndpoint.baseUrl}/match-otp-complaint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'otp': otpController.text,
      }),
    );

    if (response.statusCode == 200) {
      final OtpInputModel model =
          OtpInputModel.fromJson(jsonDecode(response.body));
      Get.snackbar(
        'Success',
        model.message,
        backgroundColor: Colors.white,
        colorText: Colors.green,
      );
      debugPrint("test===============>$model");
      Get.offAllNamed(AppRoutes.dashboard);

      return model;
    } else {
      final OtpInputModel model =
          OtpInputModel.fromJson(jsonDecode(response.body));
      Get.snackbar(
        'Error',
        model.message,
        backgroundColor: Colors.white,
        colorText: Colors.red,
      );
      throw Exception('Failed to post complaint');
    }
  }
}
