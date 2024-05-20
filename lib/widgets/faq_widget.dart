import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_rmp/widgets/text_widget.dart';

import '../kmp_color/kmp_colors.dart';
import '../sizes/sizes.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key, required this.question, required this.ans});

  final String question, ans;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(11.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              textAlign: TextAlign.start,
              text: question,
              fontSize: Sizes.fontSize * 0.9,
              color: AppColor.faqTextColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextWidget(
              textAlign: TextAlign.start,
              text: ans,
              fontSize: Sizes.fontSize * 0.9,
              color: AppColor.faqText2Color,
            ),
          ],
        ),
      ),
    );
  }
}
