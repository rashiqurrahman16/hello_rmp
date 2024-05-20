import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// Import your FaqModel class
import 'package:http/http.dart' as http;

import '../backend/api_enpoind.dart';
import '../backend/model/faq_model.dart';

class FaqController extends GetxController {
  RxList<Datum> faqList = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFaqs();
  }

  Future<void> fetchFaqs() async {
    try {
      final response =
          await http.get(Uri.parse('${ApiEndpoint.baseUrl}/get-faqs'));
      if (response.statusCode == 200) {
        final faqModel = faqModelFromJson(response.body);
        faqList.assignAll(faqModel.data);
      } else {
        // Handle error if needed
        if (kDebugMode) {
          print('Failed to load FAQs');
        }
      }
    } catch (error) {
      // Handle error if needed
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}
