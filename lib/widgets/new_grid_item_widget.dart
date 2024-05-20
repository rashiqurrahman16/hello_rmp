import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_rmp/widgets/text_widget.dart';

import '../kmp_color/kmp_colors.dart';
import '../sizes/sizes.dart';

class NewGridItemWidget extends StatelessWidget {
  const NewGridItemWidget(
      {super.key, required this.path, required this.text, this.onTap});

  final String path, text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 43.h,

        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(7.r),
          ),
          color: Colors.white,
        ),
        // height: 104.h,
        // width: 87.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 6.r),
              height: 28.h,
              width: 38.w,
              decoration: BoxDecoration(
                // color: Colors.green,
                image:
                    DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
              ),
            ),
            Container(
              color: AppColor.primaryColor,
              width: 1.2,
              height: 30,
            ),
            Container(
              width: 74.w,
              margin: EdgeInsets.only(right: 5.r),
              child: TextWidget(
                text: text,
                fontSize: Sizes.gridFont,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
