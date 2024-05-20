import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_rmp/backend/api_enpoind.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../backend/model/insert_complain_model.dart';
import '../routes/routes.dart';

class ComplaintController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController nidController = TextEditingController();

  Future<InsertComplainModel> postComplaint({
    File? imageFile,
    File? pdfFile,
  }) async {
    String url =
        '${ApiEndpoint.baseUrl}/complaint-data'; // Replace with your API endpoint.

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add text fields if provided
      if (nameController.text.isNotEmpty) {
        request.fields['name'] = nameController.text;
      }
      if (mobileController.text.isNotEmpty) {
        request.fields['mobile'] = mobileController.text;
      }
      if (emailController.text.isNotEmpty) {
        request.fields['email'] = emailController.text;
      }
      if (addressController.text.isNotEmpty) {
        request.fields['address'] = addressController.text;
      }
      if (complaintController.text.isNotEmpty) {
        request.fields['complaint'] = complaintController.text;
      }
      if (nidController.text.isNotEmpty) {
        request.fields['nid'] = nidController.text;
      }

      // Add image file if provided
      // if (imageFile != null) {
      //   request.files.add(http.MultipartFile(
      //     'image',
      //     imageFile.readAsBytes().asStream(),
      //     imageFile.lengthSync(),
      //     filename: 'profile_contact.png',
      //     contentType: MediaType('image', 'png'),
      //   ));
      // }
      if (selectedImage.value != null) {
        request.files.add(http.MultipartFile(
          'image',
          selectedImage.value!.readAsBytes().asStream(),
          selectedImage.value!.lengthSync(),
          filename: 'profile_contact.png',
          contentType: MediaType('image', 'png'),
        ));
      }

      // if (pdfFile != null) {
      //   debugPrint("working pdf");
      //   request.files.add(http.MultipartFile(
      //     'document',
      //     pdfFile.readAsBytes().asStream(),
      //     pdfFile.lengthSync(),
      //     filename: 'something.pdf',
      //     contentType: MediaType('application', 'pdf'),
      //   ));

      if (selectedFile.value != null) {
        debugPrint(
            "working pdf processs 2 ===================================>");
        request.files.add(http.MultipartFile(
          'document',
          selectedFile.value!.readAsBytes().asStream(),
          selectedFile.value!.lengthSync(),
          filename: 'something.pdf',
          contentType: MediaType('application', 'pdf'),
        ));
      }

      // request.files.add(http.MultipartFile(
      //   'document',
      //   selectedFile.openRead(), // Use openRead() to get a Stream<List<int>>
      //   selectedFile.lengthSync(),
      //   filename: basename(selectedFile.path),
      //   contentType: MediaType('application', 'pdf'),
      // ));

      var response = await request.send();

      if (response.statusCode == 201) {
        final responseJson = await response.stream.bytesToString();
        final InsertComplainModel model =
            InsertComplainModel.fromJson(jsonDecode(responseJson));
        Get.snackbar(
          'Success',
          model.message,
          backgroundColor: Colors.white,
          colorText: Colors.green,
        );
        Get.offAllNamed(AppRoutes.otpInputComplain);

        return model;
      } else {
        final responseJson = await response.stream.bytesToString();
        final InsertComplainModel model =
            InsertComplainModel.fromJson(jsonDecode(responseJson));
        Get.snackbar(
          'Error',
          model.message,
          backgroundColor: Colors.white,
          colorText: Colors.red,
        );
        throw Exception('🌟🌟🌟 Failed to post complaint');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        backgroundColor: Colors.white,
        colorText: Colors.red,
      );
      throw Exception('🌟🌟🌟🌟 Failed to post complaint');
    }
  }

  Rx<File?> selectedImage = Rx<File?>(null);

  void setImage(File? image) {
    selectedImage.value = image;
  }

  Rx<File?> selectedFile = Rx<File?>(null);

  void setFile(File? pdf) {
    // Set the selected image.
    selectedFile.value = pdf;
    debugPrint("working pdf process =================>");
  }
}
