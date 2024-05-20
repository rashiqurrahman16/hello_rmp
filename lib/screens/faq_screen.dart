import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/faq_controller.dart';
import '../kmp_color/kmp_colors.dart';
import '../sizes/sizes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/faq_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/text_widget.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({super.key});

  final controller = Get.put(FaqController());

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
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 20.r, right: 20.r),
              child: Column(
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
                          text: 'FAQ',
                          fontSize: Sizes.fontSize * 1.8,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() {
                    if (controller.faqList.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.faqList.length,
                            itemBuilder: (context, index) {
                              final faq = controller.faqList[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 7.r),
                                child: FaqWidget(
                                  question: faq.question,
                                  ans: faq.answer,
                                ),
                              );
                            },
                          ));
                    }
                  }),

                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.575,
                  //   height: 43.h,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(11.r),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         width: 7.w,
                  //       ),
                  //       Container(
                  //         width: 42.w,
                  //         height: 33.h,
                  //         decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //             image: AssetImage(Assets.icon.question.path),
                  //             fit: BoxFit.fitHeight,
                  //           ),
                  //         ),
                  //       ),
                  //       // InkWell(
                  //       //   onTap: () {},
                  //       //   child: Container(
                  //       //     height: 43.h,
                  //       //     width: MediaQuery.sizeOf(context).width * 0.41,
                  //       //     decoration: BoxDecoration(
                  //       //       borderRadius: BorderRadius.all(
                  //       //         Radius.circular(11.r),
                  //       //       ),
                  //       //       gradient: const LinearGradient(
                  //       //         colors: [
                  //       //           Color(0xff23FF00),
                  //       //           Color(0xffFFE500),
                  //       //         ],
                  //       //       ),
                  //       //     ),
                  //       //     child: Center(
                  //       //       child: SizedBox(
                  //       //         width: 107.w,
                  //       //         child: TextWidget(
                  //       //           text: 'কেএমপি সম্পকিত আপনার কোন প্রশ্ন?',
                  //       //           fontSize: Sizes.fontSize * 0.8,
                  //       //           color: Colors.black,
                  //       //           fontWeight: FontWeight.w600,
                  //       //         ),
                  //       //       ),
                  //       //     ),
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: FooterWidget(),
        )
      ],
    );
  }
}
