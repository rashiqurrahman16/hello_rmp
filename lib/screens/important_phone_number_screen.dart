import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/controllers/phone_book_controller.dart';
import '/widgets/footer_widget.dart';
import '../custom_assets/assets.gen.dart';
import '../kmp_color/kmp_colors.dart';
import '../sizes/sizes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/text_widget.dart';

class ImportantPhoneNumberScreen extends StatelessWidget {
  ImportantPhoneNumberScreen({super.key});

  final phoneBookController = Get.put(PhoneBookController());

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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 28.r, right: 28.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 306.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  color: AppColor.kmpColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: 'জরুরী ফোন নম্বর',
                      fontSize: Sizes.fontSize * 1.8,
                      color: const Color(0xffFF0000),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () {
                  if (phoneBookController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: phoneBookController.phoneBookList.length,
                        itemBuilder: (context, index) {
                          final phoneBook =
                              phoneBookController.phoneBookList[index];
                          return _importantPhoneNumberWidget(
                            context,
                            phoneBook.name,
                            phoneBook.phone,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.r),
          child: const FooterWidget(),
        ),
      ],
    );
  }

  _importantPhoneNumberWidget(BuildContext context, String text1, text2) {
    RxBool isVisible = false.obs;
    return InkWell(
      onTap: () {
        isVisible.value = !isVisible.value;
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(11.sp),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    Assets.dashboardIcon.profileContact.path,
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: text1,
                        fontSize: 18.sp,
                        color: const Color(0xff2C338E),
                      ),
                      Obx(() {
                        return Visibility(
                          visible: isVisible.value,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.sp,
                                    color: const Color(0xff4B4B4B),
                                  ),
                                  children: text2
                                      .split(',')
                                      .map<TextSpan>((textPart) {
                                    return TextSpan(
                                      text: textPart.trim(),
                                      // Remove leading/trailing spaces
                                      children: const <TextSpan>[
                                        TextSpan(text: '\n'),
                                        // Add a new line after each part
                                      ],
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 6.r),
                child: Obx(
                  () => Icon(
                    isVisible.value == true
                        ? Iconsax.arrow_up_2
                        : Iconsax.arrow_down_1,
                    size: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
