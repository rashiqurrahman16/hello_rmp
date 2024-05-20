import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class NewPortalScreen extends StatelessWidget {
  NewPortalScreen({super.key});

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  final String url = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(url),
            ),
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              return ServerTrustAuthResponse(
                  action: ServerTrustAuthResponseAction.PROCEED);
            },
            onWebViewCreated: (controller) {},
            onLoadStart: (controller, url) {
              isLoading.value = true;
            },
            onLoadStop: (controller, url) {
              isLoading.value = false;
            },
          ),
          //
          ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (context, isLoading, _) {
              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
