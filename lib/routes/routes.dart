import 'package:get/get.dart';

import '../bindings/splash_binding.dart';
import '../screens/about_us.dart';
import '../screens/dashboard_screen.dart';
import '../screens/faq_screen.dart';
import '../screens/give_complain_screen.dart';
import '../screens/give_info_form_screen.dart';
import '../screens/important_phone_number_screen.dart';
import '../screens/news_portal.dart';
import '../screens/otp_input_screen_complaint.dart';
import '../screens/otp_input_screen_information.dart';
import '../screens/privacy_and_policy.dart';
import '../screens/splash_screen.dart';
import '../screens/terms_condition.dart';
import '../screens/under_maintaince_screen.dart';
// Import your screen files

class AppRoutes {
  // static const String home = '/home';
  static const String details = '/details';
  static const String splash = '/splash';
  static const String infoForm = '/infoForm';
  static const String complainForm = '/complainForm';
  static const String dashboard = '/dashboard';
  static const String otpInputInformation = '/otpInputInformation';
  static const String otpInputComplain = '/otpInputComplain';
  static const String faq = '/faq';
  static const String importantPhoneNumber = '/importantPhoneNumber';
  static const String underMaintenance = '/underMaintenance';
  static const String onlineNewsPortal = '/onlineNewsPortal';
  static const String aboutUs = '/aboutUs';
  static const String termsAndCondition = '/termsAndCondition';
  static const String privacy = '/privacy';

  static List<GetPage> get pages => [
        GetPage(
          name: splash,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        // GetPage(name: home, page: () => const HomeScreen()),
        GetPage(name: privacy, page: () => const PrivacyAndPolicyScreen()),
        GetPage(name: termsAndCondition, page: () => TermsAndConditionScreen()),
        GetPage(name: aboutUs, page: () => const AboutUsScreen()),
        GetPage(name: infoForm, page: () => GiveInfoFormScreen()),
        GetPage(name: complainForm, page: () => GiveComplainScreen()),
        GetPage(name: dashboard, page: () => DashboardScreen()),
        GetPage(
            name: otpInputInformation, page: () => OtpInputInformationScreen()),
        GetPage(name: otpInputComplain, page: () => OtpInputComplaintScreen()),
        GetPage(name: faq, page: () => FaqScreen()),
        GetPage(
            name: importantPhoneNumber,
            page: () => ImportantPhoneNumberScreen()),
        GetPage(
            name: underMaintenance, page: () => const UnderMaintanceScreen()),
        GetPage(name: onlineNewsPortal, page: () => NewPortalScreen()),
        // Define more routes as needed
      ];
}
