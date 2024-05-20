import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagePickerController>(
      init: ImagePickerController(),
      builder: (controller) {
        return Column(
          children: [
            Obx(() {
              final selectedImage = controller.selectedImage.value;
              return selectedImage.isEmpty
                  ? Text('No image selected')
                  : Image.file(File(selectedImage));
            }),
            ElevatedButton(
              onPressed: () {
                controller.pickImage();
              },
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.uploadImageToApi();
              },
              child: Text('Upload Image to API'),
            ),
          ],
        );
      },
    );
  }
}

class ImagePickerController extends GetxController {
  final selectedImage = ''.obs;

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = pickedFile.path;
    }
  }

  Future<void> uploadImageToApi() async {
    final selectedImagePath = selectedImage.value;

    if (selectedImagePath.isEmpty) {
      Get.snackbar("Error", "No image selected");
      return;
    }

    final url = Uri.parse('YOUR_API_ENDPOINT_HERE');
    final request = http.MultipartRequest('POST', url);
    request.files
        .add(await http.MultipartFile.fromPath('image', selectedImagePath));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Image uploaded successfully");
      } else {
        Get.snackbar("Error", "Failed to upload image");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to upload image: $e");
    }
  }
}
