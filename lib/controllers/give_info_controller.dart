// // import 'dart:convert';
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// //
// // import '../backend/model/insert_complain_model.dart';
// // import '../routes/routes.dart';
// //
// // class GiveInfoController extends GetxController {
// //   final nameController = TextEditingController();
// //   final mobileNumberController = TextEditingController();
// //   final nidNumberController = TextEditingController();
// //   final emailController = TextEditingController();
// //   final addressController = TextEditingController();
// //   final informationController = TextEditingController();
// //   int hideStatus = 0;
// //
// //   Future<InsertComplainModel> postInformation() async {
// //     final response = await http.post(
// //       Uri.parse('https://desktopit.net/kmp/api/information-data'),
// //       headers: <String, String>{
// //         'Content-Type': 'application/json; charset=UTF-8',
// //       },
// //       body: jsonEncode(<String, dynamic>{
// //         'name': nameController.text,
// //         'mobile': mobileNumberController.text,
// //         'email': emailController.text,
// //         'address': addressController.text,
// //         'information': informationController.text,
// //         'nid': nidNumberController.text,
// //         'hide_status': hideStatus,
// //       }),
// //     );
// //
// //     if (response.statusCode == 201) {
// //       final InsertComplainModel model =
// //           InsertComplainModel.fromJson(jsonDecode(response.body));
// //       Get.snackbar(
// //         'Success',
// //         model.message,
// //         backgroundColor: Colors.white,
// //         colorText: Colors.green,
// //       );
// //       debugPrint("$model");
// //       Get.offAllNamed(AppRoutes.otpInputInformation);
// //
// //       return model;
// //     } else {
// //       final InsertComplainModel model =
// //           InsertComplainModel.fromJson(jsonDecode(response.body));
// //       Get.snackbar(
// //         'Error',
// //         model.message,
// //         backgroundColor: Colors.white,
// //         colorText: Colors.red,
// //       );
// //       throw Exception('Failed to post complaint');
// //     }
// //   }
// //
// //   Rx<File?> selectedImage = Rx<File?>(null);
// //
// //   void setImage(File? image) {
// //     selectedImage.value = image;
// //   }
// //
// //   Rx<File?> selectedFile = Rx<File?>(null);
// //   void setFile(File? file) {
// //     // Set the selected image.
// //     selectedFile.value = file;
// //   }
// // }
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../backend/api_enpoind.dart';
// import '../backend/model/insert_complain_model.dart';
//
// class GiveInfoController extends GetxController {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController complaintController = TextEditingController();
//   final TextEditingController nidController = TextEditingController();
//   int hideStatus = 0;
//   RxBool isLoading = true.obs;
//
//   Future<InsertComplainModel> postInformation({
//     File? imageFile,
//     File? pdfFile,
//   }) async {
//     final url =
//         '${ApiEndpoint.baseUrl}/information-data'; // Replace with your API endpoint.
//
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(url));
//
//       // Add text fields if provided
//       if (nameController.text.isNotEmpty) {
//         request.fields['name'] = nameController.text;
//       }
//       if (mobileController.text.isNotEmpty) {
//         request.fields['mobile'] = mobileController.text;
//       }
//       if (emailController.text.isNotEmpty) {
//         request.fields['email'] = emailController.text;
//       }
//       if (addressController.text.isNotEmpty) {
//         request.fields['address'] = addressController.text;
//       }
//       if (complaintController.text.isNotEmpty) {
//         request.fields['information'] = complaintController.text;
//       }
//       if (nidController.text.isNotEmpty) {
//         request.fields['nid'] = nidController.text;
//       }
//
//       request.fields['hide_status'] = hideStatus.toString();
//
//       // Add image file if provided
//       // if (imageFile != null) {
//       //   request.files.add(http.MultipartFile(
//       //     'image',
//       //     imageFile.readAsBytes().asStream(),
//       //     imageFile.lengthSync(),
//       //     filename: 'profile_contact.png',
//       //     contentType: MediaType('image', 'png'),
//       //   ));
//       // }
//       if (selectedImage.value != null) {
//         request.files.add(http.MultipartFile(
//           'image',
//           selectedImage.value!.readAsBytes().asStream(),
//           selectedImage.value!.lengthSync(),
//           filename: 'profile_contact.png',
//           contentType: MediaType('image', 'png'),
//         ));
//       }
//
//       // Add PDF file if provided
//       if (selectedFile.value != null) {
//         request.files.add(http.MultipartFile(
//           'document',
//           selectedFile.value!.readAsBytes().asStream(),
//           selectedFile.value!.lengthSync(),
//           filename: 'something.pdf',
//           contentType: MediaType('application', 'pdf'),
//         ));
//       }
//
//       var response = await request.send();
//       debugPrint("post complain status code ${response.statusCode.toString()}");
//
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         isLoading.value = false;
//         final responseJson = await response.stream.bytesToString();
//         final InsertComplainModel model =
//             InsertComplainModel.fromJson(jsonDecode(responseJson));
//         Get.snackbar(
//           'Success',
//           model.message,
//           backgroundColor: Colors.white,
//           colorText: Colors.green,
//         );
//         Get.offAllNamed(AppRoutes.otpInputInformation);
//
//         return model;
//       } else {
//         final responseJson = await response.stream.bytesToString();
//         final InsertComplainModel model =
//             InsertComplainModel.fromJson(jsonDecode(responseJson));
//         Get.snackbar(
//           'Error',
//           model.message,
//           backgroundColor: Colors.white,
//           colorText: Colors.red,
//         );
//         throw Exception('Failed to post complaint');
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       Get.snackbar(
//         'Error',
//         'An error occurred: $e',
//         backgroundColor: Colors.white,
//         colorText: Colors.red,
//       );
//       throw Exception('Failed to post complaint');
//     }
//   }
//
//   Rx<File?> selectedImage = Rx<File?>(null);
//
//   void setImage(File? image) {
//     selectedImage.value = image;
//   }
//
//   Rx<File?> selectedFile = Rx<File?>(null);
//
//   void setFile(File? file) {
//     // Set the selected image.
//     selectedFile.value = file;
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_rmp/backend/api_enpoind.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../backend/model/insert_complain_model.dart';
import '../routes/routes.dart';

class GiveInfoController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  int hideStatus = 0;

  Future<InsertComplainModel> postInformation({
    File? imageFile,
    File? pdfFile,
  }) async {
    final url =
        '${ApiEndpoint.baseUrl}/information-data'; // Replace with your API endpoint.

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
        request.fields['information'] = complaintController.text;
      }
      if (nidController.text.isNotEmpty) {
        request.fields['nid'] = nidController.text;
      }
      request.fields['hideStatus'] = hideStatus.toString();

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

      // Add PDF file if provided
      if (selectedFile.value != null) {
        request.files.add(http.MultipartFile(
          'document',
          selectedFile.value!.readAsBytes().asStream(),
          selectedFile.value!.lengthSync(),
          filename: 'something.pdf',
          contentType: MediaType('application', 'pdf'),
        ));
      }

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
        Get.offAllNamed(AppRoutes.otpInputInformation);

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
        throw Exception('Failed to post complaint');
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        backgroundColor: Colors.white,
        colorText: Colors.red,
      );
      throw Exception('Failed to post complaint');
    }
  }

  Rx<File?> selectedImage = Rx<File?>(null);

  void setImage(File? image) {
    selectedImage.value = image;
  }

  Rx<File?> selectedFile = Rx<File?>(null);

  void setFile(File? file) {
    // Set the selected image.
    selectedFile.value = file;
  }
}
