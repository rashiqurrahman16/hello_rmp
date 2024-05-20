import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/controllers/otp_complaint_controller.dart';
import '/widgets/otp_input_widget.dart';
import '../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';
import '../sizes/sizes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button_widget_2.dart';
import '../widgets/text_widget.dart';

class OtpInputComplaintScreen extends StatelessWidget {
  OtpInputComplaintScreen({super.key});

  final controller = Get.put(OtpComplaintController());

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
    return Padding(
      padding: EdgeInsets.only(left: 20.r, right: 20.r),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 22.h,
        ),
        Container(
          width: 306.h,
          height: 28.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: AppColor.kmpColor,
          ),
          child: Center(
            child: TextWidget(
              text: 'তথ্য দেয়ার পূর্বে লক্ষ্য করুন',
              fontSize: Sizes.fontSizeNormal,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 22.h,
        ),
        OtpInputWidget(
            enabledBorderWidth: 2.5.h,
            controller: controller.otpController,
            hintText: '* * * *',
            borderColor: AppColor.borderColor,
            path: Assets.icon.otp1.path),
        SizedBox(
          height: 8.h,
        ),
        TextWidget(
          textAlign: TextAlign.start,
          text:
              "আপনার মোবাইল নম্বরে একটি OTP (One Time Password) পাঠানো হয়েছে, সেটি প্রদান করুন।",
          fontSize: 12.sp,
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButtonWidget2(
              onTap: () {
                // controller.postOtp();

                controller.postOtp();
              },
              text: 'পরবর্তী ধাপ',
              color: const Color(0xff2C338E),
            ),
            CustomButtonWidget2(
              onTap: () {
                controller.postOtp();
              },
              text: 'বাহির',
              color: const Color(0xff6C6C6C),
            ),
          ],
        ),
      ]),
    );
  }
}
