import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/kmp_color/kmp_colors.dart';
import '/widgets/custom_app_bar.dart';
import '../widgets/text_widget.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: CustomAppBar(
        title: '',
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextWidget(
              text: "Terms And Conditions",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
                textAlign: TextAlign.justify,
                text:
                    'Welcome to Hello RPMP, the Complaint and Information Management System for Rangpur Metropolitan Police. Before using our app, please carefully read and understand the following Terms and Conditions. By accessing or using Hello RPMP, you agree to abide by these terms and conditions. \n\n1. Acceptance of Terms: By using Hello RPMP, you agree to these terms and conditions. If you do not agree with any part of these terms, please do not use our app. \n\n2. Complaints and Information Submission: Hello RPMP provides a platform for submitting complaints and information to the Rangpur Metropolitan Police. When submitting a complaint or information, you must provide accurate and truthful information. False or misleading submissions may be subject to legal action. \n\n3. Privacy: Your privacy is important to us. When submitting information, you have the option to keep your name and address private. However, please note that certain information may still be shared with law enforcement authorities as required by law. \n\n4. Document Submission: You can attach images or PDF documents to your complaints or information submissions. By doing so, you affirm that you have the necessary rights or permissions to share these documents. \n\n5. Verification with OTP: To ensure the authenticity of complaints and information submissions, Hello RPMP uses SMS OTP (One-Time Password) verification. You will receive an OTP on the mobile number you provide during submission, and you must enter this OTP to complete the submission process. \n\n6. Phone Book List: Hello RPMP includes a phone book feature that allows users to access contact information for relevant authorities and agencies. This feature is provided for informational purposes only. \n\n7. FAQ Section: The app includes an FAQ section for your convenience. Please review this section for answers to common questions about using Hello RPMP. \n\n8. Prohibited Activities: You agree not to engage in any unlawful, offensive, or abusive activities while using Hello RPMP. This includes but is not limited to harassment, impersonation, or any activity that violates the rights of others. \n\n9. Modification of Terms: Hello RPMP reserves the right to modify these terms and conditions at any time. It is your responsibility to review these terms periodically to stay informed of any changes. \n\n10. Disclaimer: While we strive to provide accurate and up-to-date information, Hello RPMP makes no warranties or representations regarding the accuracy, completeness, or reliability of the content on the app. Your use of the app and its content is at your own risk. \n\n11.Limitation of Liability: Hello RPMP, its officers, employees, or affiliates shall not be liable for any direct or indirect damages arising from the use or inability to use the app. \n\n12. Governing Law: These terms and conditions are governed by the laws of Bangladesh. Any disputes arising from the use of Hello RPMP shall be subject to the jurisdiction of the appropriate courts in Bangladesh. \n\n13. Contact Information: If you have any questions or concerns about these terms and conditions or the Hello RPMP app, please contact us at [contact email or phone number]. By using Hello RPMP, you acknowledge that you have read and understood these Terms and Conditions and agree to comply with them. Thank you for using Hello RPMP to help us maintain a safer and more informed community. I hope this is what you were looking for. Let me know if you have any other questions.\n\nBy using Hello RPMP, you acknowledge that you have read and understood these Terms and Conditions and agree to comply with them. Thank you for using Hello RPMP to help us maintain a safer and more informed community.',
                fontSize: 12.sp)
          ],
        ),
      ),
    );
  }
}
