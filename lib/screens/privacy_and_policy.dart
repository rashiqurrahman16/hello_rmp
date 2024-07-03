import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/kmp_color/kmp_colors.dart';
import '/widgets/custom_app_bar.dart';
import '../widgets/text_widget.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({super.key});

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
              text: "Privacy & Policy",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
                textAlign: TextAlign.justify,
                text:
                    'Your privacy is important to us at Hello RMP, the Complaint and Information Management System for Rajshahi Metropolitan Police. This Privacy Policy explains how we collect, use, disclose, and protect your personal information when you use our app. By using Hello RMP, you consent to the practices described in this Privacy Policy. \n\n1. Information We Collect: \na. Complaint and Information Submission: When you submit a complaint or information, we may collect the following information: \n - Name  \n - Mobile number  \n - Email address (optional) \n - Address (optional) \n - Images or PDF documents related to your submission \n\nb. SMS OTP Verification: To verify your submissions, we collect your mobile number for SMS OTP (One-Time Password) verification. \n\nc. Phone Book List: We may collect and display contact information for relevant authorities and agencies in our phone book list. \n\n2. Use of Information:\na. Complaint and Information Processing:\n We use the information you provide to process your complaints and information submissions to the Rangpur Metropolitan Police. \n\nb. SMS OTP Verification: Your mobile number is used for OTP verification during the submission process to ensure the authenticity of your submissions. \n\nc. Phone Book List: Contact information in the phone book list is provided for informational purposes to assist users in reaching relevant authorities and agencies. \n\n3. Privacy Options:\n a. Name and Address: You have the option to keep your name and address private when submitting information. However, please note that certain information may still be shared with law enforcement authorities as required by law. \n\n4. Security: We take data security seriously and employ industry-standard measures to protect your information from unauthorized access, disclosure, alteration, or destruction. \n\n5. Disclosure of Information: We may disclose your information when required by law or to comply with legal processes. We may also share aggregated, non-personal information for statistical or analytical purposes. \n\n6. Third-Party Links: Hello RPMP may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these third-party websites or services. \n\n7. Updates to Privacy Policy: We may update this Privacy Policy from time to time to reflect changes in our practices. You should review this Privacy Policy periodically for any updates. \n\n8. Contact Us: If you have any questions or concerns regarding this Privacy Policy or the use of your personal information, please contact us at [contact email or phone number]. By using Hello RPMP, you acknowledge that you have read and understood this Privacy Policy and agree to the collection and use of your information as described herein. Your privacy is important to us, and we are committed to protecting your personal information to the best of our ability. Thank you for using Hello RPMP.',
                fontSize: 12.sp),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                TextWidget(
                  text: 'Privacy & Policy:',
                  fontSize: 12.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                //todo
                TextWidget(
                  text: 'http://rpmpadmin.picatus.com/privacy',
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
