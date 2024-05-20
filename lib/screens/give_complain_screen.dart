import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/controllers/post_complain_controller.dart';
import '/kmp_color/kmp_colors.dart';
import '/widgets/custom_app_bar.dart';
import '/widgets/pdf_picker.dart';
import '../custom_assets/assets.gen.dart';
import '../routes/routes.dart';
import '../sizes/sizes.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_button_widget_2.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/footer_widget.dart';
import '../widgets/information_text_field.dart';
import '../widgets/text_widget.dart';

class GiveComplainScreen extends StatelessWidget {
  GiveComplainScreen({super.key});

  final controller = Get.put(ComplaintController());

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
    return ListView(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 20.r, right: 20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      text: 'অভিযোগ করার পূর্বে লক্ষ্য করুন',
                      fontSize: Sizes.fontSizeNormal,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                TextWidget(
                    textAlign: TextAlign.justify,
                    text:
                        'যেকোনো অভিযোগ করার জন্য প্রথমে আপনার নিকটস্থ থানায় যোগাযোগ করুন। যদি সেখানে সাহায্য না পান, শুধুমাত্র সে ক্ষেত্রে অনলাইনের মাধ্যমে অভিযোগ জানাতে পারেন। অভিযোগ করার সময় সতর্কতার সাথে ফরমটি পূরণ করুন। অভিযোগকারীর তথ্য দিয়ে ফরমটি পূরণ করতে হবে। পরবর্তী ধাপে আপনার মোবাইল ফোনে একটি ওটিপি কোড (ওয়ান টাইম পাসওয়ার্ড) পাঠানো হবে, সেই কোডটি প্রদান করুন এবং তথ্য জমা দিন।',
                    fontSize: 15.h),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  enabledBorderWidth: 2.5.h,
                  controller: controller.nameController,
                  hintText: 'নাম',
                  isRequired: true,
                  borderColor: AppColor.borderColor,
                  path: Assets.icon.profile.path,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  enabledBorderWidth: 2.5.h,
                  controller: controller.mobileController,
                  isRequired: true,
                  hintText: 'মোবাইল নম্বর',
                  borderColor: AppColor.borderColor,
                  path: Assets.icon.phone.path,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  enabledBorderWidth: 2.5.h,
                  controller: controller.nidController,
                  hintText: 'জাতীয় পরিচয়পত্র নম্বর',
                  borderColor: AppColor.borderColor,
                  path: Assets.icon.nid.path,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: 'ইমেইল',
                  enabledBorderWidth: 2.5.h,
                  borderColor: AppColor.borderColor,
                  path: Assets.icon.email.path,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  isRequired: true,
                  controller: controller.addressController,
                  enabledBorderWidth: 2.5.h,
                  hintText: 'ঠিকানা',
                  borderColor: AppColor.borderColor,
                  path: Assets.icon.homeAddress.path,
                ),
                SizedBox(
                  height: 12.h,
                ),
                InformationTextFieldWidget(
                  isRequired: true,
                  controller: controller.complaintController,
                  enabledBorderWidth: 2.5.h,
                  hintText: 'তথ্য',
                  borderColor: Colors.transparent,
                ),
                SizedBox(
                  height: 21.h,
                ),
                Text(
                  "অভিযোগ সংক্রান্ত কোন ডকুমেন্ট, ছবি থাকলে সংযুক্ত করুন",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWidget(
                      path: Assets.dashboardIcon.camera.path,
                      text: 'ছবি সংযুক্ত করুন',
                      color: const Color(0xffFF7A00),
                    ),
                    PdfFilePickerButton(
                      path: Assets.dashboardIcon.pdf.path,
                      text: 'ডকুমেন্ট সংযুক্ত করুন',
                      color: const Color(0xffFFC20E),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWidget2(
                      onTap: () {
                        controller.postComplaint();

                        debugPrint('testing');
                      },
                      text: 'পরবর্তী ধাপ',
                      color: const Color(0xff2C338E),
                    ),
                    CustomButtonWidget2(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.dashboard);
                      },
                      text: 'বাহির',
                      color: const Color(0xff6C6C6C),
                    ),
                  ],
                ),
                SizedBox(
                  height: 33.h,
                ),
              ],
            ),
          ),
        ),
        const FooterWidget(),
      ],
    );
  }
}
